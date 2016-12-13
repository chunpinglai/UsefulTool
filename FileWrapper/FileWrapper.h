//
//  FileWrapper.h
//  TestTool
//
//  Created by AbbyLai on 2016/12/13.
//  Copyright © 2016年 AbbyLai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface FileWrapper : NSObject
+ (NSDictionary *)getVideoDataWithUploadFormat:(PHAsset *)asset;
+ (NSDictionary *)getImageDataWithUploadFormat:(PHAsset *)asset;
+ (NSDictionary *)getImageDataWithUploadFormatByFilePath:(NSString *)filePath;
@end
