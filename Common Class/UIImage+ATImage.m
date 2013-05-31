//
//  UIImage+ATImage.m
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "UIImage+ATImage.h"

@implementation UIImage (ATImage)
+(UIImage*)ATimageNamed:(NSString*)Imagename
{
    UIImage *img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:Imagename ofType:@""]];
    return img;
}
@end
