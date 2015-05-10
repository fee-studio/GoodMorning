//
//  EEInsetsLabel.h
//  Dobby
//
//  Created by efeng on 14/11/5.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//


/**
*  增强的Label
*
*  1, 增加 inset 功能
*  2, 增加 copy paste 操作功能
*
*
*/


#import <UIKit/UIKit.h>

@interface EEEnhancedLabel : UILabel

@property(nonatomic) UIEdgeInsets insets;

- (id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets;

- (id)initWithInsets:(UIEdgeInsets)insets;

- (id)initWithActionAndFrame:(CGRect)frame;

@end
