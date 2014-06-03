//
//  UPDataRetrieval.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comment.h"
#import "Event.h"
@interface UPDataRetrieval : NSObject

+(void)getEvents:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;

+(void)getSpecificEvent:(NSString *)cwid eventID:(NSString *)eventID completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;
+(void)rsvpEvent:(NSString *)cwid event:(Event *)event completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;

+(void)submitComment:(NSString *)cwid comment:(Comment *)comment completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;

+(void)retrieveComments:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;

@end
