//
//  UIView+ATview.m
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "UIView+ATview.h"
#import "UIImage+ATImage.h"

@implementation UIView (ATview)
static UIImageView *blackTint;

+(void) ATaddSubView:(UIView*)subview ParentView:(UIView*)ParentView Frame:(CGRect)frame Hide:(BOOL)hide NeedBlackTintImage:(BOOL)NeedBlackTintImage
{
    blackTint = [[UIImageView alloc]initWithImage:[UIImage ATimageNamed:@"black_tint_popup@2x.png"]];
    blackTint.frame = frame;
    [subview setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    if (NeedBlackTintImage)
    {
        [blackTint addSubview:subview];
        [ParentView addSubview:blackTint];
        [subview setHidden:hide];
        [blackTint setUserInteractionEnabled:YES];
    }
    else
    {
        [ParentView addSubview:subview];
        [subview setHidden:hide];
    }
}
+(void)ATRemoveSubviewBlackTint
{
    for (UIView *v in blackTint.subviews)
    {
        [v removeFromSuperview];
    }
    [blackTint removeFromSuperview];
    blackTint = nil;
}
@end
