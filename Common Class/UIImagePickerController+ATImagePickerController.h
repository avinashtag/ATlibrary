//
//  UIImagePickerController+ATImagePickerController.h
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "ELCAlbumPickerController.h"
#import "ELCImagePickerController.h"


typedef enum{
    ATImagePickerMediaVideo = 0,
    ATImagePickerMediaImage,
    ATImagePickerMediaBoth,
}ATImagePickerMediatype;



@interface UIImagePickerController (ATImagePickerController)
+(void) ATImagePickerControllerOpenPhotoLibrary:(id)_self ImagePickerType:(ATImagePickerMediatype)Mtype ImageAllowsEditing:(BOOL)Editing TransitionStyle:(UIModalTransitionStyle)style;
+(void) ATImagePickerControllerOpenCamera:(id)_self ImagePickerType:(ATImagePickerMediatype)Mtype ImageAllowsEditing:(BOOL)Editing TransitionStyle:(UIModalTransitionStyle)style;
+(void)ATmultipleImageSelector:(id)delegate;
@end
