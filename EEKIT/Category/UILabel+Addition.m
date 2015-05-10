//
//  UILabel+Addition.m
//  Dobby
//
//  Created by efeng on 14-7-30.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)

- (CGRect)resizeToStretch {

    CGSize size = [self expectedWidth];

    CGRect newFrame = [self frame];
    newFrame.size.width = ceilf(self.frame.size.width);
    newFrame.size.height = ceilf(size.height);
    [self setFrame:newFrame];

    return self.frame;
}

- (CGSize)expectedWidth {

    [self setNumberOfLines:0];

    CGSize maximumLabelSize = CGSizeMake(self.frame.size.width, 9999);

//    CGSize expectedLabelSize = [[self text] sizeWithFont:[self font]
//                                       constrainedToSize:maximumLabelSize
//                                           lineBreakMode:[self lineBreakMode]];

    CGSize expectedLabelSize = [self.text boundingRectWithSize:maximumLabelSize options:NSStringDrawingTruncatesLastVisibleLine attributes:nil context:nil].size;

    CGFloat marginValue = 10.f;
    expectedLabelSize.width += marginValue;
    expectedLabelSize.height += marginValue;

    /*
    if (expectedLabelSize.width < self.frame.size.width) {
        expectedLabelSize.width = self.frame.size.width;
    } else {
        expectedLabelSize.width += marginValue;
    }
    
    if (expectedLabelSize.height < self.frame.size.height) {
        expectedLabelSize.height = self.frame.size.height;
    } else {
        expectedLabelSize.height += marginValue;
    }
     */

    return expectedLabelSize;
}

- (CGSize)calSizeOnText {
    [self setNumberOfLines:0];
    CGSize maximumLabelSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGRect rect = [self.text boundingRectWithSize:maximumLabelSize
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:nil
                                          context:nil];
    CGSize size = rect.size;
    NSLog(@"cal rect = %@", NSStringFromCGRect(rect));
    return size;
}

- (UILabel *)autoWidthOnText {
    if (self.text.isEmpty) {
        CGRect frame = self.frame;
        frame.size.width = 0;
        self.frame = frame;
    } else {
        CGSize maximumSize = CGSizeMake(MAXFLOAT, self.frame.size.height);
        CGSize size = [self.text boundingRectWithSize:maximumSize
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:nil
                                              context:nil].size;
        NSLog(@"cal size = %@", NSStringFromCGSize(size));
        CGRect newFrame = self.frame;
        newFrame.size.width = ceilf(size.width);
        newFrame.size.height = ceilf(self.frame.size.height);
        self.frame = newFrame;
    }
    return self;
}

- (UILabel *)autoHeightOnText {
    if (self.text.isEmpty) {
        CGRect frame = self.frame;
        frame.size.height = 0;
        self.frame = frame;
    } else {
        CGSize maximumSize = CGSizeMake(self.frame.size.width, MAXFLOAT);
        CGSize size = [self.text boundingRectWithSize:maximumSize
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:nil
                                              context:nil].size;
        CGRect newFrame = self.frame;
        newFrame.size.width = ceilf(self.frame.size.width);
        newFrame.size.height = ceilf(size.height);
        self.frame = newFrame;
    }
    return self;
}


@end
