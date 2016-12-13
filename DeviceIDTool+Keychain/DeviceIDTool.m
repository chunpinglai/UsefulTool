//
//  DeviceIDTool.m
//  MobileEngine
//
//  Created by AbbyLai on 2016/12/12.
//  Copyright © 2016年 AbbyLai. All rights reserved.
//

#import "DeviceIDTool.h"
#import <UIKit/UIKit.h>
#import <UICKeyChainStore.h>

static NSString * const KeyChain_DeviceIDKey = @"deviceId";

@implementation DeviceIDTool

+ (NSString *)getDeviceID {
    UICKeyChainStore *keychainStore = [UICKeyChainStore keyChainStore]; //Without using accessGroup.
    NSString *deviceID = [keychainStore stringForKey:KeyChain_DeviceIDKey];
    if (deviceID) {
        return deviceID;
    }
    else {
        deviceID = [DeviceIDTool generateDeviceIDByIDFV];
        UICKeyChainStore *keychainStore = [UICKeyChainStore keyChainStore];
        keychainStore[KeyChain_DeviceIDKey] = deviceID;
        return deviceID;
    }
}

+ (NSString *)generateDeviceIDByIDFV {
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return idfv;
}

@end
