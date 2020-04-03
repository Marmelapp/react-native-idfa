//
//  PTRIDFA.m
//  IDFA
//
//  Created by Tomas Roos on 22/07/16.
//  Copyright © 2016 Tomas Roos. All rights reserved.
//

#import "PTRIDFA.h"
#import <React/RCTUtils.h>
#import <UIKit/UIKit.h>
@import AdSupport;

@implementation PTRIDFA

RCT_EXPORT_MODULE()

-(dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(getIDFA:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    if([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        NSUUID *idfa = [ASIdentifierManager.sharedManager advertisingIdentifier];
        resolve([idfa UUIDString]);
    } else {
        resolve(@"");
    }
}

RCT_EXPORT_METHOD(getIDFV:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSUUID *idfv = [UIDevice.currentDevice identifierForVendor];
    resolve([idfv UUIDString]);
}

@end
