//
//  EEBaseInfoUtil.h
//  Dobby
//
//  Created by efeng on 14-6-25.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EEBaseInfoUtil : NSObject

// 应用的版本号
+ (NSString *)appVersion;

// unix时间戳
+ (NSString *)unixTimestamp;

@end
