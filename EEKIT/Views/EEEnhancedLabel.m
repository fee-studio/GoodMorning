//
//  EEInsetsLabel.m
//  Dobby
//
//  Created by efeng on 14/11/5.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import "EEEnhancedLabel.h"

@implementation EEEnhancedLabel

- (id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets {
    self = [super initWithFrame:frame];
    if (self) {
        self.insets = insets;
    }
    return self;
}

- (id)initWithInsets:(UIEdgeInsets)insets {
    self = [super init];
    if (self) {
        self.insets = insets;
    }
    return self;
}

- (id)initWithActionAndFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self attachTapHandler];
    }
    return self;

}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

#pragma mark - UIPasteboard/UIMenuController

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copy:)) {
        return YES;
    }
    else if (action == @selector(paste:)) {
        return NO;
    }
    else if (action == @selector(cut:)) {
        return NO;
    }
    else if (action == @selector(select:)) {
        return NO;
    }
    else if (action == @selector(delete:)) {
        return NO;
    }
    return NO;
}

- (void)attachTapHandler {
    self.userInteractionEnabled = YES;  //用户交互的总开关
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    touch.numberOfTapsRequired = 1;
    [self addGestureRecognizer:touch];
}

- (void)handleTap:(UIGestureRecognizer *)recognizer {
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}

- (void)copy:(id)sender {
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}

- (void)paste:(id)sender {
    self.textAlignment = NSTextAlignmentRight;
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    self.text = [NSString stringWithFormat:@"粘贴内容：%@", pboard.string];
    NSLog(@"pboard.string : %@", pboard.string);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self attachTapHandler];
}

@end
