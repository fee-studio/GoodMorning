//
//  EEBaseInfoUtil.m
//  Dobby
//
//  Created by efeng on 14-6-25.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import "EEBaseInfoUtil.h"

@implementation EEBaseInfoUtil


+ (NSString *)appVersion {
    NSString *version = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)unixTimestamp {

    NSDate *date = [NSDate date];
    NSTimeInterval timestamp = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%li", (long) timestamp];
}


@end
