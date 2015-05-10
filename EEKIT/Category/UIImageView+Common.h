//
//  UIImageView+Common.h
//  YNBusiness
//
//  Created by khf on 15/4/7.
//  Copyright (c) 2015年 yunniao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Common)
- (void)doCircleFrame;

- (void)doNotCircleFrame;

- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;
@end
