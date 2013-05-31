//
//  ATerrorModel.h
//  ATlibrary
//
//  Created by Vertax on 31/05/13.
//  Copyright (c) 2013 Avinash Tag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATerrorModel : NSObject

@property (strong ,nonatomic)NSString *errorMessage;
@property (strong, nonatomic)NSMutableArray *dataWithError;
@end
