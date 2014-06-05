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
    NSString *urlString = [NSString stringWithFormat:@"%@%@", UPWebserviceAddress, @"/api/Event/events"];
    NSString *urlQueryString = [NSString stringWithFormat:@"?cwid=%@", cwid];
    NSString *finalQueryString = [NSString stringWithFormat:@"%@%@", urlString, urlQueryString];
    
    NSURL *url = [NSURL URLWithString:finalQueryString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
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
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    RegistrantDTO *registrant=[[RegistrantDTO alloc]init];
    [registrant build:event.eventId];
    NSData *registrantData= [registrant JSONData];
    [request setHTTPBody:registrantData];
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
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", UPWebserviceAddress, @"/api/Comment/priorFeeback"];
    NSString *urlQueryString = [NSString stringWithFormat:@"?cwid=%@", cwid];
    NSString *finalQueryString = [NSString stringWithFormat:@"%@%@", urlString, urlQueryString];
    
    NSURL *url = [NSURL URLWithString:finalQueryString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}

@end
