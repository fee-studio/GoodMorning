//
//  EESegmentedControlViewController.h
//  Dobby
//
//  Created by efeng on 14-5-20.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import "EEBaseViewController.h"


@interface EESegmentedControlViewController : EEBaseViewController


@property(nonatomic, assign) UIViewController *selectedViewController;
@property(nonatomic, strong) UISegmentedControl *segmentedControl;
@property(nonatomic, assign) NSInteger selectedViewControllerIndex;
@property (nonatomic,strong) UIView *sgmctrContainerView; // 包含子VC的View的View

- (void)bindViewControllersToSegmentedControl:(NSArray *)viewControllers;

- (void)setSelectedViewControllerIndex:(NSInteger)index;

// 子类重写
- (void)selectCompletion;
@end
