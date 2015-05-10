//
//  EECheckBoxButton.h
//  Dobby
//
//  Created by efeng on 14-6-6.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol EECheckBoxButtonDelegate;


@interface EECheckBoxButton : UIButton


@property(nonatomic, assign) id <EECheckBoxButtonDelegate> delegate;
@property(nonatomic, assign) BOOL checked;
@property(nonatomic, retain) id userInfo;


@end


@protocol EECheckBoxButtonDelegate <NSObject>

- (void)didSelectedCheckBox:(EECheckBoxButton *)checkbox checked:(BOOL)checked;

@end