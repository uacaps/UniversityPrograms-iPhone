//
//  WebOperation.m
//  SafeSchools
//
//  Created by Matthew York on 1/10/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import "WebOperation.h"

@implementation WebOperation
-(void)main {
    // Execute
    NSError *error;
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] init];
    self.responseData = [NSURLConnection sendSynchronousRequest:self.request returningResponse:&response error:&error];
    self.ResponseStatusCode = [response statusCode];
    self.LocalizedStatusCodeString = [NSHTTPURLResponse localizedStringForStatusCode:self.ResponseStatusCode];
}

#pragma mark - JSON Request Methods

-(void)setJsonRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url  completion:(void (^)(void))block{
    [self setRequestWithBodyData:data forHttpMethod:httpMethod url:url headers:nil contentType:CONTENT_TYPE_JSON completion:block];
}

-(void)setJsonRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block{
    [self setRequestWithBodyData:data forHttpMethod:httpMethod url:url headers:headers contentType:CONTENT_TYPE_JSON completion:block];
}

-(void)setJsonGetRequestWithUrl:(NSString *)url  completion:(void (^)(void))block{
    [self setRequestWithBodyData:nil forHttpMethod:HTTP_METHOD_GET url:url headers:nil contentType:CONTENT_TYPE_JSON completion:block];
}

-(void)setJsonGetRequestWithUrl:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block{
    [self setRequestWithBodyData:nil forHttpMethod:HTTP_METHOD_GET url:url headers:headers contentType:CONTENT_TYPE_JSON completion:block];
}

-(void)setJsonDeleteRequestWithUrl:(NSString *)url  completion:(void (^)(void))block{
    [self setRequestWithBodyData:nil forHttpMethod:HTTP_METHOD_DELETE url:url headers:nil contentType:CONTENT_TYPE_JSON completion:block];
}

-(void)setJsonDeleteRequestWithUrl:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block{
    [self setRequestWithBodyData:nil forHttpMethod:HTTP_METHOD_DELETE url:url headers:nil contentType:CONTENT_TYPE_JSON completion:block];
}

#pragma mark - XML Request Methods

-(void)setXmlRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url  completion:(void (^)(void))block{
    [self setRequestWithBodyData:data forHttpMethod:httpMethod url:url headers:nil contentType:CONTENT_TYPE_XML completion:block];
}

-(void)setXmlRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block{
    [self setRequestWithBodyData:data forHttpMethod:httpMethod url:url headers:headers contentType:CONTENT_TYPE_XML completion:block];
}

-(void)setXmlGetRequestWithUrl:(NSString *)url  completion:(void (^)(void))block{
    [self setRequestWithBodyData:nil forHttpMethod:HTTP_METHOD_GET url:url headers:nil contentType:CONTENT_TYPE_XML completion:block];
}

-(void)setXmlGetRequestWithUrl:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block{
    [self setRequestWithBodyData:nil forHttpMethod:HTTP_METHOD_GET url:url headers:headers contentType:CONTENT_TYPE_XML completion:block];
}

-(void)setXmlDeleteRequestWithUrl:(NSString *)url  completion:(void (^)(void))block{
    [self setRequestWithBodyData:nil forHttpMethod:HTTP_METHOD_DELETE url:url headers:nil contentType:CONTENT_TYPE_XML completion:block];
}

-(void)setXmlDeleteRequestWithUrl:(NSString *)url headers:(NSDictionary *)headers completion:(void (^)(void))block{
    [self setRequestWithBodyData:nil forHttpMethod:HTTP_METHOD_DELETE url:url headers:nil contentType:CONTENT_TYPE_XML completion:block];
}

#pragma mark - Master Request Methods

-(void)setRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url contentType:(NSString *)contentType  completion:(void (^)(void))block{
    [self setRequestWithBodyData:data forHttpMethod:httpMethod url:url headers:nil contentType:contentType completion:block];
}

-(void)setRequestWithBodyData:(NSData *)data forHttpMethod:(NSString *)httpMethod url:(NSString *)url headers:(NSDictionary *)headers contentType:(NSString *)contentType completion:(void (^)(void))block{
    //Create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10.0];
    [request setHTTPBody:data];
    [request setHTTPMethod:httpMethod];
    [request setAllHTTPHeaderFields:(headers ? headers : @{})];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    //Set request and completion block
    self.completionBlock = block;
    self.request = request;
}

#pragma mark - Status Code Checking

-(BOOL)responseStatusCodeIsInformational{
    if (self.ResponseStatusCode >= 100 && self.ResponseStatusCode < 200) {
        return YES;
    }
    
    return NO;
}

-(BOOL)responseStatusCodeIsSuccessful{
    if (self.ResponseStatusCode >= 200 && self.ResponseStatusCode < 300) {
        return YES;
    }
    
    return NO;
}

-(BOOL)responseStatusCodeIsRedirection{
    if (self.ResponseStatusCode >= 300 && self.ResponseStatusCode < 400) {
        return YES;
    }
    
    return NO;
}

-(BOOL)responseStatusCodeIsClientError{
    if (self.ResponseStatusCode >= 400 && self.ResponseStatusCode < 500) {
        return YES;
    }
    
    return NO;
}

-(BOOL)responseStatusCodeIsServerError{
    if (self.ResponseStatusCode >= 500 && self.ResponseStatusCode < 600) {
        return YES;
    }
    
    return NO;
}

@end
