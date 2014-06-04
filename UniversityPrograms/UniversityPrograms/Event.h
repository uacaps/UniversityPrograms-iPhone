//
//  EventObject.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
@property NSString *eventId;
@property NSString *eventName;
@property NSString *eventDescription;
@property NSDate *startDate;
@property NSDate *endDate;
@property BOOL isRegistered;
@property NSString *imageUrl;


@end
