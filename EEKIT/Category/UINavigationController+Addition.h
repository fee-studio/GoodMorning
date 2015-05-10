//
//  UINavigationController+Addition.h
//  Dobby
//
//  Created by efeng on 14/10/30.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Addition)

- (NSArray *)popToViewControllerBackLevel:(NSUInteger)level animated:(BOOL)animated;

- (NSArray *)popToViewControllerFrontLevel:(NSInteger)level animated:(BOOL)animated;


@end
