//
//  FileWrapper.m
//  TestTool
//
//  Created by AbbyLai on 2016/12/13.
//  Copyright © 2016年 AbbyLai. All rights reserved.
//

#import "FileWrapper.h"

static NSString * const uploadFile_image_mimetype = @"image/png";
static NSString * const uploadFile_image_fileName = @"iOS_Image";
static NSString * const uploadFile_video_mimetype = @"video/mp4";
static NSString * const uploadFile_video_fileName = @"iOS_Video.mp4";

@implementation FileWrapper

+ (NSDictionary *)getVideoDataWithUploadFormat:(PHAsset *)asset {
    if (!asset) {
        return nil;
    }
    __block NSURL *fileURL = nil;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[PHImageManager defaultManager] requestAVAssetForVideo:asset options:nil resultHandler:^(AVAsset *asset, AVAudioMix *audioMix, NSDictionary *info)
     {
         if ([asset isKindOfClass:[AVURLAsset class]])
         {
             fileURL = [(AVURLAsset*)asset URL];
             dispatch_semaphore_signal(semaphore);
         }
     }];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    if (!fileURL) {
        return nil;
    }
    NSData *sourceData = [NSData dataWithContentsOfURL:fileURL];
    if (!sourceData) {
        return nil;
    }
    NSDictionary *result = @{@"mimetype":uploadFile_video_mimetype,
                             @"content": sourceData,
                             //@"name":@"document", //API param
                             @"fileName":uploadFile_video_fileName
                             };
    return result;
}

+ (NSDictionary *)getImageDataWithUploadFormat:(PHAsset *)asset {
    if (!asset) {
        return nil;
    }
    __block NSURL *fileURL = nil;
    __block NSData *selectedImageData = nil;
    
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.synchronous = YES;
    [[PHImageManager defaultManager] requestImageDataForAsset:asset options:options resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
        fileURL = [info objectForKey:@"PHImageFileURLKey"];
        selectedImageData = imageData;
    }];
    
    if (!selectedImageData) {
        return nil;
    }
    NSDictionary *result = @{@"mimetype":uploadFile_image_mimetype,
                             @"content": selectedImageData,
                             //@"name":@"document", //API param
                             @"fileName":uploadFile_image_fileName
                             };
    return result;
}

+ (NSDictionary *)getImageDataWithUploadFormatByFilePath:(NSString *)filePath {
    if (!filePath) {
        return nil;
    }
    NSData *imageData = [NSData dataWithContentsOfFile:filePath];
    
    if (!imageData) {
        return nil;
    }
    NSDictionary *result = @{@"mimetype":uploadFile_image_mimetype,
                             @"content": imageData,
                             //@"name":@"document", //API param
                             @"fileName":uploadFile_image_fileName
                             };
    return result;
}
@end
