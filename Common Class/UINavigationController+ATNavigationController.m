//
//  UINavigationController+ATNavigationController.m
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "UINavigationController+ATNavigationController.h"

@implementation UINavigationController (ATNavigationController)

+(UIViewController*) ATviewControllerPresentInNavigationController:(UINavigationController*)nav ViewControllerClassName:(NSString*)cls
{
    UIViewController *Object;
    NSArray *arrSearchIn = [nav viewControllers];
    for (UIViewController *ctr in arrSearchIn)
    {
        if ([ctr isKindOfClass:NSClassFromString(cls)])
        {
            Object = ctr;
            break;
        }
    }
    return Object;
}
@end
