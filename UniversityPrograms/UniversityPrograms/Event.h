//
//  EventObject.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property NSString *Name;
@property NSString *Description;
@property NSDate *StartDate;
@property NSDate *EndDate;
@property BOOL isRegistered;
@property NSString *imageUrl;


@end
