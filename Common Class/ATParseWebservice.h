//
//  ATParseWebservice.h
//  ATlibrary
//
//  Created by Vertax on 30/05/13.
//  Copyright (c) 2013 Avinash Tag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATWebservieEnum.h"

@interface ATParseWebservice : NSObject
+(NSMutableArray*)ATparseWebserviceResult:(id)response_Object WebserviceIdentifier:(ATWebserviceId)webserviceId;

@end
