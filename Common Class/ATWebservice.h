//
//  ATWebservice.h
//  ATlibrary
//
//  Created by Vertax on 30/05/13.
//  Copyright (c) 2013 Avinash Tag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATWebservieEnum.h"

typedef enum {
    MBhud = 0,
    ActivityIndicatorOnly,
    ActivityIndicatorWithDisableView,
}ProgressViewType;

@protocol ATWebServiceResult <NSObject>

@required
-(void)ATParseSuceefull:(id)ParsedModel;
-(void)ATParseFailed:(id)ParsedModel;
@end

@interface ATWebservice : NSObject
{
    
}
+(ATWebservice*)SharedObject;
@property (nonatomic, strong)id<ATWebServiceResult>delegate;
@property (assign, nonatomic) NSInteger WebService_Identifier;
@property (strong,nonatomic)NSString *User_Id;

-(void)ATHTTPGetUrl:(NSString*)url Delegate:(id)_self WebserviceIdentifier:(ATWebserviceId)WebserviceId ProgressViewStyle:(ProgressViewType)Pview;
-(void)ATHTTPPostUrl:(NSString*)url PostDictionary:(NSDictionary*)dict Delegate:(id)_self  UserId:(NSString*)UserId WebserviceIdentifier:(ATWebserviceId)WebserviceId ProgressViewStyle:(ProgressViewType)Pview;
+(NSMutableURLRequest*)ATGetPostRequest:(NSMutableData*)body Url:(NSString*)urlString;


@end
