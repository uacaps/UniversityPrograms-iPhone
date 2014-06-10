//
//  UnRSVPDTO.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UnRSVPDTO.h"

@implementation UnRSVPDTO


-(void)buildWithEventId:(NSString *)eventID{
    self.eventId=eventID;
    self.cwid=[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"];
    
    
}

@end
