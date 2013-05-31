//
//  UIAlertView+ATAlertView.h
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATUIAlertview.h"

@interface UIAlertView (ATAlertView)
@property (strong,nonatomic) ATUIAlertview *AlertView;

+(void)ATAlertWithError:(NSString*)AlertMessage CancelButtonTitle:(NSString*)cancelButtonTitle ALertTitle:(NSString*)AlertTitle AlertViewBackgroundColorRed:(float)red Green:(float)green Blue:(float)blue Apha:(float)alpha StrokeColorRed:(float)sred StrokeGreen:(float)sgreen StrokeBlue:(float)sblue StrokeApha:(float)salpha;
+(void)ATAlertWithError:(NSString*)AlertMessage CancelButtonTitle:(NSString*)cancelButtonTitle ALertTitle:(NSString*)AlertTitle ;
+(void)ATAlertWithCancel:(NSString*)cancelButtonTitle AlertMessage:(NSString*)AlertMessage ALertTitle:(NSString*)AlertTitle AlertViewBackgroundColorRed:(float)red Green:(float)green Blue:(float)blue Apha:(float)alpha StrokeColorRed:(float)sred StrokeGreen:(float)sgreen StrokeBlue:(float)sblue StrokeApha:(float)salpha;
+(void)ATAlertWithCancel:(NSString*)cancelButtonTitle AlertMessage:(NSString*)AlertMessage ALertTitle:(NSString*)AlertTitle;
-(void)AlertView_Activity_indicator_Stop;
-(void)ATAlertViewWithActivityindicatorTitle:(NSString*)Title Message:(NSString*)Message AlertViewBackgroundColorRed:(float)red Green:(float)green Blue:(float)blue Apha:(float)alpha StrokeColorRed:(float)sred StrokeGreen:(float)sgreen StrokeBlue:(float)sblue StrokeApha:(float)salpha UIActivityStyle:(UIActivityIndicatorViewStyle)style;

@end
