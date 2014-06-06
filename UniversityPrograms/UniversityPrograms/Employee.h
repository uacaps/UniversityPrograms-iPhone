//
//  Employee.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject
@property NSString *name;
@property NSString *title;
@property NSString *phone;
@property NSString *email;
@property NSString *imageURL;
-(instancetype)initWithName:(NSString *)name title:(NSString *)title phoneOrYear:(NSString *)phone emailOrMajor:(NSString *)email;
+(NSArray *)buildArrayOfEmployees;
@end
