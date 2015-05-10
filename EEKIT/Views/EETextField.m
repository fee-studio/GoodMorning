//
//  EETextField.m
//  Dobby
//
//  Created by efeng on 14-6-6.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//
//  实现UITextField的内容Inset效果


#import "EETextField.h"

@implementation EETextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

// 实现文字两边不顶头的效果

- (CGRect)textRectForBounds:(CGRect)bounds {

    [super textRectForBounds:bounds];

    return CGRectInset(bounds , 5 , 0 );
}

- (CGRect)editingRectForBounds:(CGRect)bounds {

    return CGRectInset(bounds , 5 , 0 );
}

@end
