//
//  DeviceIDTool.h
//  MobileEngine
//
//  Created by AbbyLai on 2016/12/12.
//  Copyright © 2016年 AbbyLai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceIDTool : NSObject
+ (NSString *)getDeviceID;
+ (NSString *)generateDeviceIDByIDFV;
@end
