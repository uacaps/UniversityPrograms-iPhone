//
//  UPDataRetrieval.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UPDataRetrieval.h"
#import "NSObject+ObjectMap.h"
#import "UPWebserviceConstants.h"
#import "RegistrantDTO.h"
#import "UnRSVPDTO.h"

@implementation UPDataRetrieval
NSOperationQueue *opQueue;

+(NSOperationQueue *)_operationQueue
{
    if (opQueue == nil) {
        opQueue = [[NSOperationQueue alloc] init];
    }
    return opQueue;
}


+(void)getEvents:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{
    //basic url string
    NSString *urlString = [NSString stringWithFormat:@"%@%@", UPWebserviceAddress, @"/api/Event/events"];
    //url query string
    NSString *urlQueryString = [NSString stringWithFormat:@"?cwid=%@", cwid];
    //preivous 2 combined
    NSString *finalQueryString = [NSString stringWithFormat:@"%@%@", urlString, urlQueryString];
    //create url
    NSURL *url = [NSURL URLWithString:finalQueryString];
    //create request with url
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    //send asycnronousrequest with the completion block being handled by the calling function
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}

+(void)getSpecificEvent:(NSString *)cwid eventID:(NSString *)eventID completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{
    NSString *urlString = [NSString stringWithFormat:@"%@%@", UPWebserviceAddress, @"/api/Event/getEvent"];
    NSString *urlQueryString = [NSString stringWithFormat:@"?eventId=%@&cwid=%@", eventID, cwid];
    NSString *finalQueryString = [NSString stringWithFormat:@"%@%@", urlString, urlQueryString];
    
    NSURL *url = [NSURL URLWithString:finalQueryString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}


+(void)rsvpEvent:(NSString *)cwid event:(Event *)event completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{
    NSString *urlString = [NSString stringWithFormat:@"%@%@", UPWebserviceAddress, @"/api/Event/rsvp"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    //default method is GET, so you must change it to POST
    [request setHTTPMethod:@"POST"];
    //declare what you are getting back
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    RegistrantDTO *registrant=[[RegistrantDTO alloc]init];
    [registrant buildWithEventID:event.eventId];
    NSData *registrantData= [registrant JSONData];
    [request setHTTPBody:registrantData];
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}
+(void)unrsvp:(NSString *)cwid event:(Event *)event completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{
    NSString *urlString = [NSString stringWithFormat:@"%@%@", UPWebserviceAddress, @"/api/Event/unrsvp"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    UnRSVPDTO *unrsvp=[[UnRSVPDTO alloc]init];
    [unrsvp buildWithEventId:event.eventId];
    
    NSData *unrsvpData= [unrsvp JSONData];
    [request setHTTPBody:unrsvpData];
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}

+(void)submitComment:(NSString *)cwid comment:(Comment *)comment completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{

    NSString *urlString = [NSString stringWithFormat:@"%@%@", UPWebserviceAddress, @"/api/Comment/addcomment"];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData *commentData = [comment JSONData];
    [request setHTTPBody:commentData];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}


+(void)retrieveComments:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", UPWebserviceAddress, @"/api/Comment/Comments"];
    NSString *urlQueryString = [NSString stringWithFormat:@"?cwid=%@", cwid];
    NSString *finalQueryString = [NSString stringWithFormat:@"%@%@", urlString, urlQueryString];
    
    NSURL *url = [NSURL URLWithString:finalQueryString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}

@end
