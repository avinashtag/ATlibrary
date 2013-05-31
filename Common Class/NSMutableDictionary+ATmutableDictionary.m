//
//  NSMutableDictionary+ATmutableDictionary.m
//  CampusKnot
//
//  Created by Avinash Tag on 30/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "NSMutableDictionary+ATmutableDictionary.h"

@implementation NSMutableDictionary (ATmutableDictionary)
+(NSMutableDictionary*)ATReplaceNullFromDictionary:(NSMutableDictionary*)dict replacementString:(NSString*)str
{
    NSArray *Keys = [dict allKeys];
    for (int i = 0; i<[Keys count]; i++) {
        if ((NSNull*)[dict objectForKey:[Keys objectAtIndex:i]] == [NSNull null]) {
            [dict setValue:str forKey:[Keys objectAtIndex:i]];
        }
    }
    return dict;
}

@end
