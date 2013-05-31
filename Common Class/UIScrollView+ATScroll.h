//
//  UIScrollView+ATScroll.h
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ATScroll)
+(void)ATScrollHorizontal:(UIScrollView*)Scroll PageNumber:(NSInteger)PagePostion ScrollEnableAfterScroll:(BOOL)isScroll ScrollAnimated:(BOOL)SAnimate;
+(void)ATScrollUp:(UIScrollView*)scr FloatOrYposition:(float)y HeightOrFloatValue:(float)up;
+(void)ATScrollDown:(UIScrollView*)scr FloatOrYposition:(float)y;

@end
