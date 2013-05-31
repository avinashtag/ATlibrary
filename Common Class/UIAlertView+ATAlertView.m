//
//  UIAlertView+ATAlertView.m
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "UIAlertView+ATAlertView.h"

@implementation UIAlertView (ATAlertView)

BOOL canVirate;

@dynamic AlertView;
#pragma mark Alert View

-(void)ATAlertViewWithActivityindicatorTitle:(NSString*)Title Message:(NSString*)Message AlertViewBackgroundColorRed:(float)red Green:(float)green Blue:(float)blue Apha:(float)alpha StrokeColorRed:(float)sred StrokeGreen:(float)sgreen StrokeBlue:(float)sblue StrokeApha:(float)salpha UIActivityStyle:(UIActivityIndicatorViewStyle)style
{
	self.AlertView = [[ATUIAlertview alloc] initWithTitle:Title message:Message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [self.AlertView setBackgroundColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha] withStrokeColor:[UIColor colorWithRed:sred/255.0f green:sgreen/255.0f blue:sblue/255.0f alpha:salpha]];
    UIActivityIndicatorView *progress= [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(125, 75, 30, 30)];
    progress.activityIndicatorViewStyle = style;
    [self.AlertView addSubview:progress];
    [progress startAnimating];
    [self.AlertView show];
}

-(void)AlertView_Activity_indicator_Stop
{
	[self.AlertView dismissWithClickedButtonIndex:0 animated:YES];
}
+(void)ATAlertWithCancel:(NSString*)cancelButtonTitle AlertMessage:(NSString*)AlertMessage ALertTitle:(NSString*)AlertTitle AlertViewBackgroundColorRed:(float)red Green:(float)green Blue:(float)blue Apha:(float)alpha StrokeColorRed:(float)sred StrokeGreen:(float)sgreen StrokeBlue:(float)sblue StrokeApha:(float)salpha
{
	ATUIAlertview *alertView=[[ATUIAlertview alloc] initWithTitle:AlertTitle message:AlertMessage delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    [alertView setBackgroundColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha] withStrokeColor:[UIColor colorWithRed:sred/255.0f green:sgreen/255.0f blue:sblue/255.0f alpha:salpha]];
	[alertView show];
}
+(void)ATAlertWithCancel:(NSString*)cancelButtonTitle AlertMessage:(NSString*)AlertMessage ALertTitle:(NSString*)AlertTitle
{
	ATUIAlertview *alertView=[[ATUIAlertview alloc] initWithTitle:AlertTitle message:AlertMessage delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
	[alertView show];
}
+(void)ATAlertWithError:(NSString*)AlertMessage CancelButtonTitle:(NSString*)cancelButtonTitle ALertTitle:(NSString*)AlertTitle AlertViewBackgroundColorRed:(float)red Green:(float)green Blue:(float)blue Apha:(float)alpha StrokeColorRed:(float)sred StrokeGreen:(float)sgreen StrokeBlue:(float)sblue StrokeApha:(float)salpha
{
    @try {
        ATUIAlertview *alertView=[[ATUIAlertview alloc] initWithTitle:AlertTitle message:AlertMessage delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
        [alertView setBackgroundColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha] withStrokeColor:[UIColor colorWithRed:sred/255.0f green:sgreen/255.0f blue:sblue/255.0f alpha:salpha]];
        [alertView vibrateAlert:0.50];
        [alertView show];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
	
}

+(void)ATAlertWithError:(NSString*)AlertMessage CancelButtonTitle:(NSString*)cancelButtonTitle ALertTitle:(NSString*)AlertTitle
{
    @try {
        ATUIAlertview *alertView=[[ATUIAlertview alloc] initWithTitle:AlertTitle message:AlertMessage delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
        [alertView vibrateAlert:0.50];
        [alertView show];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
	
}





@end
