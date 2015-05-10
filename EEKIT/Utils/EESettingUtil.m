//
//  EESettingUtil.m
//  MagicWallpaper
//
//  Created by efeng on 14-7-13.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import "EESettingUtil.h"




@implementation EESettingUtil



+ (void)toScorePageOfAppStore {

//    NSString *str = [NSString stringWithFormat: @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",kAppId];
    
    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",@"app id"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

}

+ (void)toHomePageOfAppStore {

//    NSString *str2 = [NSString stringWithFormat: @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@", @"911260002"];
    
    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",@"kAppId"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

@end
