//
//  WebservieProgressView.h
//  ATlibrary
//
//  Created by Vertax on 30/05/13.
//  Copyright (c) 2013 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface WebservieProgressView : NSObject

+(UIView*)ATWebserviceProgressView:(UIActivityIndicatorViewStyle)style ActivityIndicatorFrame:(CGRect)F;
+(MBProgressHUD*)ATWebserviceProgressMBViewDetailMessage:(NSString*)msg;
@end
