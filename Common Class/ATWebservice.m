//
//  ATWebservice.m
//  ATlibrary
//
//  Created by Vertax on 30/05/13.
//  Copyright (c) 2013 Avinash Tag. All rights reserved.
//

#import "ATWebservice.h"
#import "SBJSON.h"
#import "GlobalWebservice.h"
#import "Constants.h"

#import "MBProgressHUD.h"
#import "WebservieProgressView.h"
#import "ATParseWebservice.h"
#import "UIAlertView+ATAlertView.h"
#import "NSString+ATString.h"
#import "NSDate+ATDate.h"
#import "ATerrorModel.h"

@interface ATWebservice(Private)

- (void)makeRequest_GetMethod:(NSString*)url_String;
@end
@implementation ATWebservice

@synthesize User_Id;

static ATWebservice* Object_Shared = Nil;
static id progressView = nil;

NSMutableData *PostDataBody;
+(ATWebservice*)SharedObject
{
    @synchronized([ATWebservice class])
    {
        if (!Object_Shared)
            Object_Shared = [[self alloc] init];
        return Object_Shared;
    }
    return nil;
}

-(void)ATHTTPPostUrl:(NSString*)url PostDictionary:(NSDictionary*)dict Delegate:(id)_self  UserId:(NSString*)UserId WebserviceIdentifier:(ATWebserviceId)WebserviceId ProgressViewStyle:(ProgressViewType)Pview
{
    [ATWebservice initializeProgressViewWithProgressViewStyle:Pview];
    _WebService_Identifier = WebserviceId;
    self.delegate = _self;
    NSString* postUrl = [NSString stringWithFormat:@"%@%@",MainUrl,url];
    NSMutableData *PostBody = [ATWebservice ATPostDataWithDictionary:dict UserId:UserId];
    NSDictionary *post = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:PostBody,postUrl, nil] forKeys:[NSArray arrayWithObjects:@"Body",@"url", nil]];
    [self performSelectorInBackground:@selector(GloablPost:) withObject:post];
}

-(void)ATHTTPGetUrl:(NSString*)url Delegate:(id)_self WebserviceIdentifier:(ATWebserviceId)WebserviceId ProgressViewStyle:(ProgressViewType)Pview
{    [ATWebservice initializeProgressViewWithProgressViewStyle:Pview];
    _WebService_Identifier = WebserviceId;
    self.delegate = _self;
    NSString* postUrl = [NSString stringWithFormat:@"%@%@",MainUrl,url];
    [self performSelectorInBackground:@selector(makeRequest_GetMethod:) withObject:postUrl] ;
}

+(NSMutableURLRequest*)ATGetPostRequest:(NSMutableData*)body Url:(NSString*)urlString
{
    // setting up the request object now
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    return request;
}

#pragma mark

#pragma mark Private methods

+(void)initializeProgressViewWithProgressViewStyle:(ProgressViewType)Pview
{
    switch (Pview) {
        case MBhud:
            progressView = [WebservieProgressView ATWebserviceProgressMBViewDetailMessage:@"Please wait.."];
            [progressView setTag:MBhud];
            break;
        case ActivityIndicatorWithDisableView:
            progressView = [WebservieProgressView ATWebserviceProgressMBViewDetailMessage:@"Please wait.."];
            [progressView setTag:ActivityIndicatorWithDisableView];
            break;
        case ActivityIndicatorOnly:
            progressView = [WebservieProgressView ATWebserviceProgressMBViewDetailMessage:@"Please wait.."];
            [progressView setTag:ActivityIndicatorOnly];
            break;
        default:
            break;
    }
}


-(void)GloablPost:(NSDictionary*)PostData
{
    @autoreleasepool {
        id Result = [GlobalWebservice PostData:[PostData objectForKey:@"Body"] Url:[PostData objectForKey:@"url"]];
        BOOL Reachable = [self IsServerReachable:Result];
        id ResultParsed;
        if ((NSNull*)[[Result objectAtIndex:0] objectForKey:@"status"]!= [NSNull null]&& Reachable == YES)
        {
            ResultParsed = [ATParseWebservice ATparseWebserviceResult:Result WebserviceIdentifier:self.WebService_Identifier];
        }
        else
        {
            ResultParsed = @"404";
        }
        [self performSelectorOnMainThread:@selector(CallDelegateOnMainThread:) withObject:ResultParsed waitUntilDone:YES];
        
    }
}

- (void)makeRequest_GetMethod:(NSString*)url_String
{
    @autoreleasepool
    {
        id Result = [GlobalWebservice ExecuteWebService:url_String];
        BOOL Reachable = [self IsServerReachable:Result];
        id ResultParsed;
        if ((NSNull*)[[Result objectAtIndex:0] objectForKey:@"status"]!= [NSNull null]&& Reachable == YES)
        {
            ResultParsed = [ATParseWebservice ATparseWebserviceResult:Result WebserviceIdentifier:self.WebService_Identifier];
        }
        else
        {
            ResultParsed = @"404";
        }
        [self performSelectorOnMainThread:@selector(CallDelegateOnMainThread:) withObject:ResultParsed waitUntilDone:YES];
    }
}

#pragma mark Post Methods

+(NSMutableData*)ATPostDataWithDictionary:(NSDictionary*)Post UserId:(NSString*)struid
{
    __block NSMutableData *data = [[NSMutableData alloc] init];
    [Post enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop)
     {
         data =[ATWebservice SetPostData:object ForKey:key UserIdIfSendingImage:struid PostBody:data];
     }];
    return data;
}

+(NSMutableData*)SetPostData:(id)Postdata ForKey:(NSString*)Key UserIdIfSendingImage:(NSString*)userid PostBody:(NSMutableData*)data
{
    [data appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    if ([Postdata isKindOfClass:NSClassFromString(@"NSString")]) {
        [data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@",Key,Postdata] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    else if ([Postdata isKindOfClass:NSClassFromString(@"NSArray")])
    {
        for (id d in Postdata)
        {
            [data appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@[]\"\r\n\r\n%@",Key,d] dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    
    else if ([Postdata isKindOfClass:NSClassFromString(@"NSData")])
    {
        NSString *strUnique = [NSString stringWithFormat:@"%@%@",userid,[NSString ATstringFromDate:[NSDate date] DateFormatRequired:@"dd/MM/yyyy,HH:mm:ss"]];
        [data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@[]\"; filename=\"%@.jpg\"\r\n",Key, strUnique] dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:Postdata];
    }
    else if ([Postdata isKindOfClass:NSClassFromString(@"UIImage")])
    {
        NSData *Postdataconverted = UIImagePNGRepresentation(Postdata);
        NSString *strUnique = [NSString stringWithFormat:@"%@%@",userid,[NSString ATstringFromDate:[NSDate date] DateFormatRequired:@"dd/MM/yyyy,HH:mm:ss"]];
        [data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@[]\"; filename=\"%@.jpg\"\r\n",Key, strUnique] dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:Postdataconverted];
    }
    return data;
    
}


#pragma mark Private methods
-(void)CallDelegateOnMainThread:(id)response
{
    [self StopProgressView];
    if ([response isKindOfClass:NSClassFromString(@"NSString")]&& [response isEqualToString:@"404"])
    {
        [UIAlertView ATAlertWithError:@"Server not reachable. Please check your internet connection." CancelButtonTitle:@"OK" ALertTitle:AppName];
    }
    else if ([response isKindOfClass:NSClassFromString(@"NSArray")])
    {
        if (_WebService_Identifier == 1)//login
        {
            User_Id = @"74";//save userid;
        }
        if ([[response objectAtIndex:0] isKindOfClass:NSClassFromString(@"ATerrorModel")]) {
            [self.delegate ATParseFailed:response];
        }
        else
        [self.delegate ATParseSuceefull:response];
    }
}

-(void)StopProgressView
{
    if ([progressView isKindOfClass:NSClassFromString(@"MBProgressHUD")]) {
        MBProgressHUD *mbhudtemp = (MBProgressHUD*)progressView;
        [mbhudtemp hide:YES];
    }
    else
    {
        UIView *viewTemp = (UIView*)progressView;
        [viewTemp removeFromSuperview];
    }
}

-(BOOL)IsServerReachable:(id)Result
{
    BOOL t = NO;
    if ([Result isKindOfClass:NSClassFromString(@"NSString")]) {
        if ([Result isEqualToString:@"NOT REACHABLE"]) {
            t= NO;
            [self performSelectorOnMainThread:@selector(servernotreachAlert) withObject:nil waitUntilDone:YES];
        }
        else
            t = YES;
    }
    return t;
}


@end
