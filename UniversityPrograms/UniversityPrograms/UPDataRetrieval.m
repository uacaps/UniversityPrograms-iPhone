//
//  UPDataRetrieval.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

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


+(void)getEvents{
    
}

+(void)getSpecificEvent{
    
}
+(void)rsvpEvent{
    
}
+(void)submitComment{
    
}
+(void)retrieveComments{
    
}
@end
