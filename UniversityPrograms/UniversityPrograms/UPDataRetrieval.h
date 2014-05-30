//
//  UPDataRetrieval.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UPDataRetrieval : NSObject

+(void)getEvents:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;

+(void)getSpecificEvent:(NSString *)cwid eventID:(NSString *)eventID completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;
+(void)rsvpEvent:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;

+(void)submitComment:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;

+(void)retrieveComments:(NSString *)cwid completetionHandler:(void (^__weak)(NSURLResponse *, NSData *, NSError *))block;

@end
