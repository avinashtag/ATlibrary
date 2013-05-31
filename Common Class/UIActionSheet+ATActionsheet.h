//
//  UIActionSheet+ATActionsheet.h
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (ATActionsheet)

+(void) ATActionSheetShowWithEndSelector:(SEL)EndSelector delegate:(id)_self UIACtionSheetStyle:(UIActionSheetStyle)style Title:(NSString*)Title CancelButtonTitle:(NSString*)CancelTitle DestructiveButtonTitle:(NSString*)dButtonTitle DoneButtonTitle:(NSString*)DoneTitle OtherButtonTitles:   (NSString *)othrButtonTitles, ... ;
+(void)ATActionSheetWithDatePicker:(id)_self DoneSelector:(SEL)Selector DatePickerMode:(UIDatePickerMode)mode UIACtionSheetStyle:(UIActionSheetStyle)style Title:(NSString*)Title DoneButtonTitle:(NSString*)done DatePicker:(UIDatePicker*)ATdatePicker;
+ (void)ATActionSheetWithPickerTitle:(NSString*)Title Datasource:(id)datasource delegate:(id)delegate EndSelector:(SEL)EndSelector delegate:(id)_self DoneButtonTitle:(NSString*)done UIPicker:(UIPickerView *)pickerView;
@end
