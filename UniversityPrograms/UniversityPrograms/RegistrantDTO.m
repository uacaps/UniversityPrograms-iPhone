//
//  Registrant.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/4/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "RegistrantDTO.h"

@implementation RegistrantDTO

-(void)build:(NSString *)eventId{
    self.email=[[NSUserDefaults standardUserDefaults]stringForKey:@"email"];
    self.lastName=[[NSUserDefaults standardUserDefaults]stringForKey:@"userFirstName"];
    self.firstName=[[NSUserDefaults standardUserDefaults]stringForKey:@"userLastName"];
    self.cwid=[[NSUserDefaults standardUserDefaults]stringForKey:@"cwid"];
    self.eventId=eventId;
}
@end
