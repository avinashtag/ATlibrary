//
//  NSObject+ATCommon.m
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "NSObject+ATCommon.h"
#import "UIAlertView+ATAlertView.h"

@implementation NSObject (ATCommon)

- (void)ATDialTelNumber: (NSString*)telNumber
{
    // fix telNumber NSString
    NSArray* telComponents = [telNumber componentsSeparatedByCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    telNumber = [telComponents componentsJoinedByString: @""];
    NSString* urlString = [NSString stringWithFormat: @"telprompt:%@", telNumber];
    NSURL* telURL = [NSURL URLWithString: urlString];
    //NSLog( @"Attempting to dial %@ with urlString: %@ and URL: %@", telNumber, urlString, telURL );
    if ( [[UIApplication sharedApplication] canOpenURL: telURL] )
    {
        [[UIApplication sharedApplication] openURL: telURL];
    }
    else
    {
        [UIAlertView ATAlertWithError:@"Problem in dialing the number" CancelButtonTitle:@"OK" ALertTitle:AppName];
    }
}


-(CGRect)ATchatTextViewFrame:(UITextView*)textview
{
    CGRect frame = textview.frame;
    float t = textview.contentSize.height - frame.size.height ;
    frame.origin.y = frame.origin.y - t;
    frame.size.height = textview.contentSize.height;
    return frame;
    
}




@end
