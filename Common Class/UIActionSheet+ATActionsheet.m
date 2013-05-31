//
//  UIActionSheet+ATActionsheet.m
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "UIActionSheet+ATActionsheet.h"

@implementation UIActionSheet (ATActionsheet)


#pragma mark Action Sheet

+(void) ATActionSheetShowWithEndSelector:(SEL)EndSelector delegate:(id)_self UIACtionSheetStyle:(UIActionSheetStyle)style Title:(NSString*)Title CancelButtonTitle:(NSString*)CancelTitle DestructiveButtonTitle:(NSString*)dButtonTitle DoneButtonTitle:(NSString*)DoneTitle OtherButtonTitles:(NSString *)othrButtonTitles, ...
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:Title delegate:_self cancelButtonTitle:CancelTitle destructiveButtonTitle:dButtonTitle otherButtonTitles:othrButtonTitles, nil];
	[actionSheet setActionSheetStyle:style];
	UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:DoneTitle]];
	closeButton.momentary = YES;
	closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
	closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	closeButton.tintColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.0];
	[closeButton addTarget:_self action:EndSelector forControlEvents:UIControlEventValueChanged];
	[actionSheet addSubview:closeButton];
	[actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
	[actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
}

+(void)ATActionSheetWithDatePicker:(id)_self DoneSelector:(SEL)Selector DatePickerMode:(UIDatePickerMode)mode UIACtionSheetStyle:(UIActionSheetStyle)style Title:(NSString*)Title DoneButtonTitle:(NSString*)done DatePicker:(UIDatePicker*)datePicker
{
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:Title delegate:_self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	[datePicker setDatePickerMode:mode];
	[actionSheet setActionSheetStyle:style];
	[actionSheet addSubview:datePicker];
	[actionSheet setBounds:CGRectMake(0,0, 320,485)];
	CGRect pickerRect = datePicker.bounds;
	pickerRect.origin.y = -40;
	datePicker.bounds = pickerRect;
	//	[actionSheet bringSubviewToFront:picker];
	UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:done]];
	closeButton.momentary = YES;
	closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
	closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	closeButton.tintColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.0];
	[closeButton addTarget:_self action:Selector forControlEvents:UIControlEventValueChanged];
	[actionSheet addSubview:closeButton];
	[actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
	[actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
}

+ (void)ATActionSheetWithPickerTitle:(NSString*)Title Datasource:(id)datasource delegate:(id)delegate EndSelector:(SEL)EndSelector delegate:(id)_self DoneButtonTitle:(NSString*)done UIPicker:(UIPickerView *)pickerView
{
    
    UIActionSheet *actionSheetL = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	[actionSheetL setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
	CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
	pickerView.frame = pickerFrame;
	pickerView.showsSelectionIndicator = YES;
	pickerView.dataSource = datasource;
	pickerView.delegate = delegate;
	[actionSheetL addSubview:pickerView];
	UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:done]];
	closeButton.momentary = YES;
	closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
	closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	closeButton.tintColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.0];
	[closeButton addTarget:datasource action:EndSelector forControlEvents:UIControlEventValueChanged];
	[actionSheetL addSubview:closeButton];
	[actionSheetL showInView:[[UIApplication sharedApplication] keyWindow]];
	[actionSheetL setBounds:CGRectMake(0, 0, 320, 485)];
}



/*-(void)ATDissmissActionSheetWithAimation
{
    [UIView animateWithDuration:0.30 animations:^{
        
    }completion:^(BOOL finished){
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    }];
}*/

@end
