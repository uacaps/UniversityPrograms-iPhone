//
//  Employee.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "Employee.h"

@implementation Employee
-(instancetype)initWithName:(NSString *)name title:(NSString *)title phoneOrYear:(NSString *)phone emailOrMajor:(NSString *)email{
    self.name=name;
    self.title=title;
    self.phone=phone;
    self.email=email;
    
    return self;
}
+(NSArray *)buildArrayOfEmployees{
    
    Employee *e1 = [[Employee alloc] initWithName:@"LaToya Scott" title:@"Director" phoneOrYear:@"(205)348-9958" emailOrMajor:@"scott060@sa.ua.edu"];
    e1.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_2.jpg";
    Employee *e2 = [[Employee alloc] initWithName:@"Kimberly Jones" title:@"Program Assistant" phoneOrYear:@"(205)348-7525" emailOrMajor:@"kmjone13@sa.ua.edu"];
    e2.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_7.jpg";
    Employee *e3 = [[Employee alloc] initWithName:@"Averie Armstead" title:@"Graduate Assistant" phoneOrYear:@"Graduate" emailOrMajor:@"Sports Management"];
    e3.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_15.jpg";
    Employee *e4 = [[Employee alloc] initWithName:@"Jennifer McCollum" title:@"Graduate Assistant" phoneOrYear:@"Graduate" emailOrMajor:@"Public Administration"];
    e4.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_9.jpg";
    Employee *e5 = [[Employee alloc] initWithName:@"James Shetler" title:@"Graduate Assistant" phoneOrYear:@"Graduate" emailOrMajor:@"Advertising/Public Relations"];;
    e5.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_13.jpg";
    Employee *e6 = [[Employee alloc] initWithName:@"Britney Lee" title:@"Event Programmer" phoneOrYear:@"Senior" emailOrMajor:@"Public Relations"];
    e6.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_14.jpg";
    Employee *e7 = [[Employee alloc] initWithName:@"Taylor Johnson" title:@"Event Programmer" phoneOrYear:@"Junior" emailOrMajor:@"General Business"];
    e7.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_6.jpg";
    Employee *e8 = [[Employee alloc] initWithName:@"Runqiu (Candice) Ji" title:@"Event Programmer" phoneOrYear:@"Junior" emailOrMajor:@"Major: Marketing"];
    e8.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew.jpg";
    Employee *e9 = [[Employee alloc] initWithName:@"Bonnika Ashley" title:@"Event Programmer" phoneOrYear:@"Senior" emailOrMajor:@"Computer Science"];
    e9.imageURL=@"http://www.up.ua.edu/images/UP.jpg";
    Employee *e10 = [[Employee alloc] initWithName:@"Reginald Allison II" title:@"Intern" phoneOrYear:@"Graduate" emailOrMajor:@"Telecommunication and Film"];
    e10.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_16.jpg";
    Employee *e11 = [[Employee alloc] initWithName:@"Allison Terrell" title:@"Communications Team" phoneOrYear:@"Senior" emailOrMajor:@"Public Relations"];
    e11.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_11.jpg";
    Employee *e12 = [[Employee alloc] initWithName:@"Brittney Wormely" title:@"Intern" phoneOrYear:@"2nd Year Law" emailOrMajor:@"Law"];
    e12.imageURL=@"http://www.up.ua.edu/images/UPWebsite-StaffNew_18.jpg";
    
    NSArray *array = [[NSArray alloc] initWithObjects:e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, nil];
    
    return array;
}


@end
