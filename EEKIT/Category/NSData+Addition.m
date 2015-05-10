//
//  NSData+Addition.m
//  Line0
//
//  Created by line0 on 12-12-5.
//  Copyright (c) 2012年 line0. All rights reserved.
//

#import "NSData+Addition.h"

@implementation NSData (Addition)

- (NSData *)dataWithObject:(id)object {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
    return data;
}

- (id)convertDataToObject {
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:self];
    return array;
}

/**
* Returns hexadecimal string of NSData.
* Empty string if data is empty.
*/
- (NSString *)hexadecimalString {
    const unsigned char *dataBuffer = (const unsigned char *) [self bytes];

    if (!dataBuffer)
        return [NSString string];

    NSUInteger dataLength = [self length];
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];

    for (int i = 0; i < dataLength; ++i)
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long) dataBuffer[i]]];

    return [NSString stringWithString:hexString];
}

@end
