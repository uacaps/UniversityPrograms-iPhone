//
//  WebOperation.h
//  SafeSchools
//
//  Created by Matthew York on 1/10/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebOperationHeaders.h"

@interface WebOperation : NSOperation

@property (nonatomic, retain) NSData *responseData;
@property (nonatomic, retain) NSMutableURLRequest *request;
@property (nonatomic, assign) NSUInteger ResponseStatusCode;
@property (nonatomic, retain) NSString *LocalizedStatusCodeString;

#pragma mark - JSON Request Methods
-(void)setJsonRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url  completion:(void (^)(void))block;
-(void)setJsonRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block;
-(void)setJsonGetRequestWithUrl:(NSString *)url  completion:(void (^)(void))block;
-(void)setJsonGetRequestWithUrl:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block;
-(void)setJsonDeleteRequestWithUrl:(NSString *)url  completion:(void (^)(void))block;
-(void)setJsonDeleteRequestWithUrl:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block;

#pragma mark - XML Request Methods
-(void)setXmlRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url  completion:(void (^)(void))block;
-(void)setXmlRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block;
-(void)setXmlGetRequestWithUrl:(NSString *)url  completion:(void (^)(void))block;
-(void)setXmlGetRequestWithUrl:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block;
-(void)setXmlDeleteRequestWithUrl:(NSString *)url  completion:(void (^)(void))block;
-(void)setXmlDeleteRequestWithUrl:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block;

#pragma mark - Master Request Methods
-(void)setRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url contentType:(NSString *)contentType  completion:(void (^)(void))block;
-(void)setRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url headers:(NSDictionary *)headers contentType:(NSString *)contentType completion:(void (^)(void))block;

#pragma mark - Status Code Checking
-(BOOL)responseStatusCodeIsInformational;
-(BOOL)responseStatusCodeIsSuccessful;
-(BOOL)responseStatusCodeIsRedirection;
-(BOOL)responseStatusCodeIsClientError;
-(BOOL)responseStatusCodeIsServerError;

@end
