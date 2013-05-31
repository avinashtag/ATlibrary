//
//  NSDate+ATDate.h
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Vertax. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ATDate)

+(NSDate*) DateFromString:(NSString*)DateString StringDateFormat:(NSString*)format;
+(NSString*) DateStringFormatChange:(NSString*)formatGetting DateString:(NSString*)date StringDateFormatRequired:(NSString*)format;

@end
