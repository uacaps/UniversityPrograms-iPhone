//
//  LocationDTO.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/4/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationDTO : NSObject
//post function require a body, our body consists of objects
//so we must make a transferable object
@property NSString *name;
@property NSString *street1;
@property NSString *street2;
@property NSString *city;
@property NSString *state;
@property NSString *zip;
@property NSString *roomNumber;

@end
