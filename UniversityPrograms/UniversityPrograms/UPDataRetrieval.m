//
//  UPDataRetrieval.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UPDataRetrieval.h"

#import "UPDataRetrieval.h"

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
    NSString *urlString = @"https://mobileweb.caps.ua.edu/UP/api/Event";
    NSString *urlQueryString = [NSString stringWithFormat:@"?cwid=%@", cwid];
    NSString *finalQueryString = [NSString stringWithFormat:@"%@%@", urlString, urlQueryString];
    
    NSURL *url = [NSURL URLWithString:finalQueryString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}

+(void)getSpecificEvent:(NSString *)cwid eventID:(NSString *)eventID completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{
    NSString *urlString = @"https://mobileweb.caps.ua.edu/UP/api/Event";
    NSString *urlQueryString = [NSString stringWithFormat:@"?eventId=%@&cwid=%@", eventID, cwid];
    NSString *finalQueryString = [NSString stringWithFormat:@"%@%@", urlString, urlQueryString];
    
    NSURL *url = [NSURL URLWithString:finalQueryString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}


+(void)rsvpEvent:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{
    NSString *urlString = @"https://mobileweb.caps.ua.edu/UP/api/Event";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}


+(void)submitComment:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{
    NSString *urlString = @"https://mobileweb.caps.ua.edu/UP/api/Comment";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}


+(void)retrieveComments:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block{
    NSString *urlString = @"https://mobileweb.caps.ua.edu/UP/api/Comment";
    NSString *urlQueryString = [NSString stringWithFormat:@"?cwid=%@", cwid];
    NSString *finalQueryString = [NSString stringWithFormat:@"%@%@", urlString, urlQueryString];
    
    NSURL *url = [NSURL URLWithString:finalQueryString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[UPDataRetrieval _operationQueue] completionHandler:block];
}

@end
