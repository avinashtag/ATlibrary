//
//  UIScrollView+ATScroll.m
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "UIScrollView+ATScroll.h"

@implementation UIScrollView (ATScroll)

+(void)ATScrollDown:(UIScrollView*)scr FloatOrYposition:(float)y
{
    [scr scrollRectToVisible:CGRectMake(scr.frame.origin.x, y, scr.frame.size.width, scr.frame.size.height) animated:YES];
}
+(void)ATScrollUp:(UIScrollView*)scr FloatOrYposition:(float)y HeightOrFloatValue:(float)up
{
    [scr scrollRectToVisible:CGRectMake(scr.frame.origin.x, y+up, scr.frame.size.width, scr.frame.size.height) animated:YES];
}

+(void)ATScrollHorizontal:(UIScrollView*)Scroll PageNumber:(NSInteger)PagePostion ScrollEnableAfterScroll:(BOOL)isScroll ScrollAnimated:(BOOL)SAnimate
{
    [Scroll setScrollEnabled:YES];
    [Scroll scrollRectToVisible:CGRectMake(Scroll.frame.size.width*PagePostion, Scroll.frame.origin.y, Scroll.frame.size.width, Scroll.frame.size.height) animated:SAnimate];
    [Scroll setScrollEnabled:isScroll];
}


@end
