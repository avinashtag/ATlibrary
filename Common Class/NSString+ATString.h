//
//  NSString+ATString
//  common classes
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSString_ATString)

+(NSString*) ATstringByStrippingHTML:(NSString *)HtmlString;
+(NSString*) ATstringFromDate:(NSDate*)Date DateFormatRequired:(NSString*)format;
+(NSString*) ATstringInTimeFormatFromDateString:(NSString*)Date DateFormat:(NSString*)Fromat;
+(NSString*) ATstringInTimeFormatFromDate:(NSDate*)date;

+(BOOL) IsValidUrl:(NSString*)UrlString;
+(BOOL) StringContainsDigit:(NSString*)StringDigit Range:(NSRange)range;
+(BOOL) IsValidateEmail: (NSString *) candidate;
+(BOOL) IsBlankString:(NSString*)Text;
@end
