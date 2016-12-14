//
//  ViewController.m
//  TestTool
//
//  Created by AbbyLai on 2016/12/13.
//  Copyright © 2016年 AbbyLai. All rights reserved.
//

#import "ViewController.h"
#import "DeviceIDTool.h"
#import "UIImage+animatedGIF.h"
#import "FileWrapper.h"
#import "ImagePickerHandler.h"
#import "QLPreviewHandler.h"

@interface ViewController ()<ImagePickerHandlerDelegate> {
    QLPreviewHandler *QLPreview;
}
@property (nonatomic, strong) ImagePickerHandler *imagePicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getDeviceID];
    [self addGifImage];
    [self getImageDataWithAsset:nil];//asset:the media you selected.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 

- (void)getDeviceID {
    NSString *deviceID = [DeviceIDTool getDeviceID];
    NSLog(@"deviceID:%@", deviceID);
}

- (void)addGifImage {
    UIImageView *loadingImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"face2" ofType:@"gif"];
    NSURL *url= [[NSURL alloc] initFileURLWithPath:path];
    loadingImageView.image= [UIImage animatedImageWithAnimatedGIFURL:url];
    loadingImageView.center = self.view.center;
    [self.view addSubview:loadingImageView];
}

- (void)getImageDataWithAsset:(PHAsset *)asset {
    NSDictionary *result = [FileWrapper getImageDataWithUploadFormat:asset];
    NSLog(@"getImageDataWithAsset,result:%@", result);
}

#pragma mark- image picker

- (IBAction)imagePickerAction:(id)sender {
    [self showImagePicker];
}

- (void)showImagePicker {
    if (!_imagePicker) {
        _imagePicker = [[ImagePickerHandler alloc]init];
        _imagePicker.imagePickerDelegate = self;
        _imagePicker.vc = self;
        _imagePicker.maxNumberOfImages = 5;
        _imagePicker.maxNumberOfVideos = 1;
        _imagePicker.uploadVideoMaxLength = 15;
        _imagePicker.mediaSelectLimit = _imagePicker.maxNumberOfImages + _imagePicker.maxNumberOfVideos;
    }
    [_imagePicker showActionSheetInView:self.view];
}

#pragma mark ImagePickerHandlerDelegate

- (void)photoSelected:(NSArray *)assets {
    //PHAsset *assetResult = [assets objectAtIndex:0];
    QLPreview = [[QLPreviewHandler alloc]init];
    QLPreview.assetsArray = assets;
    [QLPreview showPreviewVC:self];
}

@end
