//
//  NSDate+ATDate.m
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "NSDate+ATDate.h"
#import "NSString+ATString.h"

@implementation NSDate (ATDate)


+(NSDate*) DateFromString:(NSString*)DateString StringDateFormat:(NSString*)format
{
    // i.e format = @"MM/dd/yyyy,HH:mm:ss"
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:format];
    NSDate*Datereturn = [dateformatter dateFromString:DateString];
    return Datereturn;
}


+(NSString*) DateStringFormatChange:(NSString*)formatGetting DateString:(NSString*)date StringDateFormatRequired:(NSString*)format
{
     // i.e format = @"MM/dd/yyyy,HH:mm:ss"
    NSDate *Date = [NSDate DateFromString:date StringDateFormat:formatGetting];
    NSString *str = [NSString ATstringFromDate:Date DateFormatRequired:format];
    return str;
}

@end
