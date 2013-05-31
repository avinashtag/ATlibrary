//
//  UIView+ATview.h
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ATview)

+(void) ATaddSubView:(UIView*)subview ParentView:(UIView*)ParentView Frame:(CGRect)frame Hide:(BOOL)hide NeedBlackTintImage:(BOOL)NeedBlackTintImage;
+(void)ATRemoveSubviewBlackTint;
@end
