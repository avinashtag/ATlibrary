//
//  NSString+ATUse.m
//  common classes
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "NSString+ATString.h"

@implementation NSString (NSString_ATString)


+(NSString*) ATstringByStrippingHTML:(NSString *)HtmlString {
    NSRange r;
    NSString *s = HtmlString;
    if (HtmlString == nil) {
        return @"";
    }
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    s = [s stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    s = [s stringByReplacingOccurrencesOfString:@"\r" withString:@" "];
    return s;
}

+(NSString*) ATstringFromDate:(NSDate*)Date DateFormatRequired:(NSString*)format
{
    // i.e format = @"MM/dd/yyyy,HH:mm:ss"
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:format];
    NSString * DateString = [dateformatter stringFromDate:Date ];
    return DateString;
}

+(NSString*) ATstringInTimeFormatFromDateString:(NSString*)Date DateFormat:(NSString*)Fromat
{
    // i.e format = @"MM/dd/yyyy,HH:mm:ss"
    // date = date string from webservice
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:Fromat];
    NSDate* date = [dateformatter dateFromString:Date];
    NSString* isAdult = [NSString ATstringInTimeFormatFromDate:date];
    return isAdult;
}

+(NSString*) ATstringInTimeFormatFromDate:(NSDate*)date
{
    NSString* isAdult;
    NSDate* now = [NSDate date];
    NSDateComponents* yearComponents = [[NSCalendar currentCalendar]
                                        components:NSYearCalendarUnit
                                        fromDate:date
                                        toDate:now
                                        options:0];
    NSDateComponents* monthComponents = [[NSCalendar currentCalendar]
                                         components:kCFCalendarUnitMonth
                                         fromDate:date
                                         toDate:now
                                         options:0];
    
    NSDateComponents* dayComponents = [[NSCalendar currentCalendar]
                                       components:kCFCalendarUnitDay
                                       fromDate:date
                                       toDate:now
                                       options:0];
    NSDateComponents* hourComponents = [[NSCalendar currentCalendar]
                                        components:kCFCalendarUnitHour
                                        fromDate:date
                                        toDate:now
                                        options:0];
    NSDateComponents* minuteComponents = [[NSCalendar currentCalendar]
                                          components:kCFCalendarUnitMinute
                                          fromDate:date
                                          toDate:now
                                          options:0];
    NSDateComponents* secondComponents = [[NSCalendar currentCalendar]
                                          components:kCFCalendarUnitSecond
                                          fromDate:date
                                          toDate:now
                                          options:0];
    
    if ([secondComponents second]<60) {
        isAdult = [NSString stringWithFormat:@"%i seconds ago", [secondComponents second]];
    }
    else if ([minuteComponents minute]<60) {
        isAdult = [NSString stringWithFormat:@"%i minutes ago", [minuteComponents minute]];
    }
    else if ([hourComponents hour]<24) {
        isAdult = [NSString stringWithFormat:@"%i hour ago", [hourComponents hour]];
    }
    else if ([dayComponents day]<=30) {
        isAdult = [NSString stringWithFormat:@"%i Day Ago", [dayComponents day]];
    }
    else if ([monthComponents month]<=12) {
        isAdult = [NSString stringWithFormat:@"%i Month Ago", [monthComponents month]];
    }
    else  {
        isAdult = [NSString stringWithFormat:@"%i Year Ago", [yearComponents year]];
    }
    return isAdult;
}

+(BOOL) IsValidUrl:(NSString*)UrlString
{
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:UrlString];
}

+(BOOL) IsStringContainsDigit:(NSString*)StringDigit Range:(NSRange)range
{
    BOOL isDigit;
    NSString *regex = @"[0-9]+(-[0-9]+)?";
    NSPredicate *testRegex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if([testRegex evaluateWithObject:StringDigit])
        isDigit = YES;
    else
    {
        isDigit = range.length == 1?YES:NO;
    }
    return isDigit;
}

+(BOOL) IsBlankString:(NSString*)Text
{
    BOOL Result = [[Text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]?YES:NO;
    Result = Text == nil?YES:Result;
    return Result;
}

+ (BOOL) IsValidateEmail: (NSString *) candidate
{
	NSString *emailRegEx =
	@"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
	@"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
	@"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
	@"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
	@"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
	@"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
	@"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
	NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
	return [regExPredicate evaluateWithObject:candidate];
}

@end
