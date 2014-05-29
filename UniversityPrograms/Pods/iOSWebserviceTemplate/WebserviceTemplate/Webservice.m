//
//  MOVEGPSWebservice.m
//  AlaCOPMobile
//
//  Created by Matthew York on 1/15/14.
//  Copyright (c) 2014 Matthew York. All rights reserved.
//

#import "Webservice.h"

@implementation Webservice

-(instancetype)init {
	self = [super init];
	if (self != nil) {
        self.OperationQueue = [[NSOperationQueue alloc]
                                   init];
    }
	
	return self;
}

@end
