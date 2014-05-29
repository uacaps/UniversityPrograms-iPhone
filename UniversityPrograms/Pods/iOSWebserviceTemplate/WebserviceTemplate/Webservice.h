//
//  MOVEGPSWebservice.h
//  AlaCOPMobile
//
//  Created by Matthew York on 1/15/14.
//  Copyright (c) 2014 Matthew York. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebOperation.h"

//Response blocks
typedef void(^BooleanResponseBlock)(BOOL success);
typedef void(^StringResponseBlock)(NSString *responseString);

@interface Webservice : NSObject {
    
}

@property (nonatomic, retain) NSOperationQueue *OperationQueue;
@property (nonatomic, assign) BOOL Logging;

@end
