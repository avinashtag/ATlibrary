//
//  ATUIAlertview.h
//  ATlibrary
//
//  Created by Avinash Tag on 30/05/13.
//  Copyright (c) 2013 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ATUIAlertview : UIAlertView
{
	int canIndex;
	BOOL disableDismiss;
    
}
@property (strong,nonatomic) UIColor *fillColor ;
@property (strong,nonatomic) UIColor *borderColor;

-(void) setBackgroundColor:(UIColor *) background
           withStrokeColor:(UIColor *) stroke;

- (void)disableDismissForIndex:(int)index_;
- (void)dismissAlert;
- (void)vibrateAlert:(float)seconds;

- (void)moveRight;
- (void)moveLeft;

- (void)hideAfter:(float)seconds;

- (void)stopVibration;

@end
