//
//  UIImagePickerController+ATImagePickerController.m
//  CampusKnot
//
//  Created by Avinash Tag on 29/05/13.
//  Copyright (c) 2013 Avitag. All rights reserved.
//

#import "UIImagePickerController+ATImagePickerController.h"

@implementation UIImagePickerController (ATImagePickerController)

+(void) ATImagePickerControllerOpenPhotoLibrary:(id)_self ImagePickerType:(ATImagePickerMediatype)Mtype ImageAllowsEditing:(BOOL)Editing TransitionStyle:(UIModalTransitionStyle)style
{
    UIImagePickerController *imagePicker= [[UIImagePickerController alloc] init];
	imagePicker.delegate = _self;
	imagePicker.allowsEditing = Editing;
    NSMutableArray *MediaType = [self MediaTypes:Mtype];
    imagePicker.mediaTypes = MediaType;
	imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [imagePicker setModalTransitionStyle:style];
	[_self presentModalViewController:imagePicker animated:YES];
}

+(void) ATImagePickerControllerOpenCamera:(id)_self ImagePickerType:(ATImagePickerMediatype)Mtype ImageAllowsEditing:(BOOL)Editing TransitionStyle:(UIModalTransitionStyle)style
{
    NSMutableArray *Capturetype = [self MediaTypes:Mtype];
    UIImagePickerController *imagePicker= [[UIImagePickerController alloc] init];
	imagePicker.delegate = _self;
	imagePicker.allowsEditing = Editing;
    [imagePicker setMediaTypes:Capturetype];
	imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [imagePicker setModalTransitionStyle:style];
	[_self presentModalViewController:imagePicker animated:YES];
}


+(NSMutableArray*)MediaTypes:(ATImagePickerMediatype)Mtype
{
    NSMutableArray *Mediatype = [[NSMutableArray alloc]init];
    if (Mtype == ATImagePickerMediaImage) {
        [Mediatype addObject:(NSString*)kUTTypeImage];
    }
    else if (Mtype == ATImagePickerMediaVideo) {
        [Mediatype addObject:(NSString*)kUTTypeVideo];
    }
    else if (Mtype == ATImagePickerMediaBoth) {
        [Mediatype addObject:(NSString*)kUTTypeImage];
        [Mediatype addObject:(NSString*)kUTTypeVideo];
    }
    return Mediatype;
}

+(void)ATmultipleImageSelector:(id)delegate
{
    ELCAlbumPickerController *albumController = [[ELCAlbumPickerController alloc] initWithNibName:@"ELCAlbumPickerController" bundle:[NSBundle mainBundle]];
	ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:albumController];
    [albumController setParent:elcPicker];
	[elcPicker setDelegate:delegate];
    [delegate presentViewController:elcPicker animated:YES completion:^{
        
    }];
}
@end
