//
//  Registrant.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/4/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegistrantDTO : NSObject
@property NSString *eventId;
@property NSString *cwid;
@property NSString *firstName;
@property NSString *lastName;
@property NSString *email;

-(void)build:(NSString *)eventId;
@end
