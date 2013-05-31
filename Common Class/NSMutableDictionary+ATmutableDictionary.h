//
//  NSMutableDictionary+ATmutableDictionary.h
//  CampusKnot
//
//  Created by Avinash Tag on 30/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (ATmutableDictionary)
+(NSMutableDictionary*)ATReplaceNullFromDictionary:(NSMutableDictionary*)dict replacementString:(NSString*)str;
@end
