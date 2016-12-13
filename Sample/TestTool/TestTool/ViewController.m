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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getDeviceID];
    [self addGifImage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

@end
