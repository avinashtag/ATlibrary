//
//  ATParseWebservice.m
//  ATlibrary
//
//  Created by Vertax on 30/05/13.
//  Copyright (c) 2013 Avinash Tag. All rights reserved.
//

#import "ATParseWebservice.h"
#import "ATerrorModel.h"

@implementation ATParseWebservice


+(NSMutableArray*)ATparseWebserviceResult:(id)response_Object WebserviceIdentifier:(ATWebserviceId)webserviceId
{
    NSMutableArray *Parseresult = [[NSMutableArray alloc] init];
    BOOL status = [[[response_Object objectAtIndex:0] objectForKey:@"status"] isEqualToString:@"true"]?YES:NO;
    if (!status) {
        Parseresult = [ATParseWebservice ErrorParse:response_Object];
    }
    else
    {
        response_Object = [[response_Object objectAtIndex:0] objectForKey:@"data"];
        switch (webserviceId)
        {
            case StatusPost:
                Parseresult = [ATParseWebservice GetFeed:response_Object];
                break;
            default:
                break;
        }
    }
    return Parseresult;
}

+(NSMutableArray*)ErrorParse:(NSArray*)response_Object
{
    NSMutableArray *array_Return = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *dict in response_Object) {
        ATerrorModel *Error = [[ATerrorModel alloc] init];
        Error.errorMessage = [dict objectForKey:@"message"];
        [array_Return addObject:Error];
    }
    return array_Return;
}

+(NSMutableArray*)GetFeed:(NSArray*)response_Object
{
     NSMutableArray *array_Return = [[NSMutableArray alloc] init];
    /*
   
    for (NSMutableDictionary *dict1 in response_Object) {
        NSMutableDictionary *dict=[DineWebserviceSwitch removeNullFromDictionary:dict1];
        Feed *feed = [[Feed alloc] init];
        feed.feed_id = [dict objectForKey:@"feed_id"];
        feed.privacy = [dict objectForKey:@"privacy"];
        feed.privacy_comment = [dict objectForKey:@"privacy_comment"];
        feed.type_id = [dict objectForKey:@"type_id"];
        feed.user_id = [dict objectForKey:@"user_id"];
        feed.parent_user_id = [dict objectForKey:@"parent_user_id"];
        feed.item_id = [dict objectForKey:@"item_id"];
        feed.time_stamp = [dict objectForKey:@"time_stamp"];
        feed.parent_feed_id = [dict objectForKey:@"parent_feed_id"];
        feed.user_name = [dict objectForKey:@"user_name"];
        feed.full_name = [dict objectForKey:@"full_name"];
        feed.gender = [[dict objectForKey:@"gender"] isEqualToString:@"1"]?@"Male":@"Female";
        feed.user_image = [dict objectForKey:@"user_image"];
        feed.user_group_id = [dict objectForKey:@"user_group_id"];
        feed.can_post_comment= [[dict objectForKey:@"can_post_comment"] boolValue];
        feed.feed_title =  [dict objectForKey:@"feed_title"];
        feed.feed_info = [dict objectForKey:@"feed_info"];
        feed.feed_link = [dict objectForKey:@"feed_link"];
        feed.feed_content = [dict objectForKey:@"feed_content"];
        feed.total_comment = [dict objectForKey:@"total_comment"];
        feed.feed_total_like = [dict objectForKey:@"feed_total_like"];
        feed.feed_is_liked = [[dict objectForKey:@"feed_is_liked"] boolValue];
        feed.feed_icon = [dict objectForKey:@"feed_icon"];
        feed.feed_status = [dict objectForKey:@"feed_status"] ;
        feed.feed_image = [dict objectForKey:@"iphone_feed_image"];
        feed.comment_type_id = [dict objectForKey:@"comment_type_id"];
        feed.comment_type_id = [dict objectForKey:@"comment_type_id"] ;
        feed.isMyFeed = [[dict objectForKey:@"user_id"] isEqualToString:[DineWebserviceClass SharedObject].User_Id]?YES:NO;
        
        feed.comment_id = [dict objectForKey:@"comment_id"] ;
        
        feed.IsPolled = [[dict objectForKey:@"user_voted_this_poll"] boolValue];
        id PollAnswers = [dict objectForKey:@"feed_custom_html"];
        feed.PollQuestion = [dict objectForKey:@"feed_title"];
        //For Poll only
        int tVotes = 0;
        feed.PollAnswers = [[NSMutableArray alloc] init];
        for (NSDictionary *polldict in PollAnswers) {
            PollsModel *poll = [[PollsModel alloc]init ];
            poll.answer_id =  [polldict objectForKey:@"answer_id"];
            poll.answer =  [polldict objectForKey:@"answer"];
            int i = [[polldict objectForKey:@"total_votes"] integerValue];
            if (i==1) {
                poll.Votes = [NSString stringWithFormat:@"%d Vote",i];
            }
            else
            {
                poll.Votes = [NSString stringWithFormat:@"%d Votes",i];
            }
            tVotes = tVotes + [[polldict objectForKey:@"total_votes"] integerValue];
            [feed.PollAnswers addObject:poll];
        }
        feed.totalVotes = [NSString stringWithFormat:@"%d",tVotes];
        [array_Return addObject:feed];
    }*/
    return array_Return;
}
@end
