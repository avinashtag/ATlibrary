//
//  UINavigationController+ATNavigationController.h
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ATNavigationController)
+(UIViewController*) ATviewControllerPresentInNavigationController:(UINavigationController*)nav ViewControllerClassName:(NSString*)cls;
@end
