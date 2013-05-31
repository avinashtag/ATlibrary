//
//  WebservieProgressView.m
//  ATlibrary
//
//  Created by Vertax on 30/05/13.
//  Copyright (c) 2013 Avinash Tag. All rights reserved.
//

#import "WebservieProgressView.h"


@interface WebservieProgressView ()

@end

@implementation WebservieProgressView

+(UIView*)ATWebserviceProgressView:(UIActivityIndicatorViewStyle)style ActivityIndicatorFrame:(CGRect)F
{
    UIView *DisableInteractionView = [UIView new];
    DisableInteractionView.frame = [UIApplication sharedApplication].keyWindow.frame;
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    [activity startAnimating];
    [activity setHidesWhenStopped:YES];
    activity.frame = F;
    [DisableInteractionView addSubview:activity];
    return DisableInteractionView;
}

+(MBProgressHUD*)ATWebserviceProgressMBViewDetailMessage:(NSString*)msg
{
    MBProgressHUD *progressHud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    progressHud.dimBackground = YES;
    progressHud.removeFromSuperViewOnHide = YES;
    progressHud.labelText = AppName;
    progressHud.detailsLabelText = msg;
    progressHud.square = YES;
    return progressHud;
}



@end
