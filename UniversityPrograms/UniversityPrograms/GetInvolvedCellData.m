//
//  GetInvolvedCellData.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "GetInvolvedCellData.h"

@implementation GetInvolvedCellData

-(instancetype)initWithPredefinedTitle:(NSString *)title andText:(NSString *)text{
    self.title=title;
    self.text=text;
    return self;
}

+(NSArray *)buildArrayOfDefaultData{
    GetInvolvedCellData *gt0 = [[GetInvolvedCellData alloc] initWithPredefinedTitle:@"Who We Are" andText:@"University Programs is the student-led, student-driven board, which aims to provide University of Alabama students with a variety of events that enhance the overall student experience. We are committed to supporting the overall academic, research and service mission of The University of Alabama and the Ferguson Center Student Union by providing quality collaborative programming that promotes lifelong learning and allows all students to find a place of involvement and importance."];
    GetInvolvedCellData *gt00 = [[GetInvolvedCellData alloc] initWithPredefinedTitle:@"What We Do" andText:@"The vision of University Programs is to be the central location for all on-campus programming. We will share our resources with other campus departments, student organizations and community partners to assist them in the planning, promotion and implementation of their events. In addition, we will engage students through programs to play a more active role in their experience and education at the Capstone."];
    
    GetInvolvedCellData *gt5 = [[GetInvolvedCellData alloc] initWithPredefinedTitle:@"On The Town" andText:@"On the Town with the Ferg is a new program created by the Ferguson Center that gives students the opportunity to travel off campus to explore cultures beyond the university at minimal or no cost. On the Town events provide a great opportunity for students to step outside of their comfort zones and expand their worldviews and appreciation for cultural diversity while meeting new people and making new friends. Future events may include trips to sporting events and art exhibits around the Southeast. Reserve your spot today by emailing universityprograms@sa.ua.edu."];
    GetInvolvedCellData *gt2 = [[GetInvolvedCellData alloc] initWithPredefinedTitle:@"Movie Series" andText:@"The Ferguson Center Movie Series brings popular and often pre-released movies to campus for free. The free movie showings are open to all students, faculty, staff and the surrounding community. Free popcorn and refreshments are provided. Past movie include Inception, Due Date and Social Network."];
    GetInvolvedCellData *gt3 = [[GetInvolvedCellData alloc] initWithPredefinedTitle:@"International Expression" andText:@"Share your culture and learn about others at International Expressions events at The Ferg. Past events include Chinese New Year, Japanese Fall Festival Aki Matsuri, International Food & Flair, and Hispanic Heritage Celebration."];
    GetInvolvedCellData *gt4 = [[GetInvolvedCellData alloc] initWithPredefinedTitle:@"Hot Topic" andText:@"This popular discussion series allows students to talk about a controversial topic in a neutral setting. A moderator facilitates the discussion. Hot Topics provides students with a space where they can freely discuss issues and current events that are important to them. Hot Topics is free and open to all UA students. Free food and refreshments are provided at the event. Past hot topics include Religious Discrimination, Racism: Then & Now and Social Media vs. Real Life."];
    GetInvolvedCellData *gt1 = [[GetInvolvedCellData alloc] initWithPredefinedTitle:@"Discovery Series" andText:@"Find your talent. Discover your ability. The Discovery Series are non-credit classes open to UA students, faculty and staff as well as the Tuscaloosa community. Get ready to discover a new talent, hobby, or passion! All enrollments will require payment within 5 business days of registration. All payments need to be taken to Room 356 Ferguson Center (The Ferguson Center Union Director's office). Acceptable payments include cash, check, or credit card. We currently do not take any action card payments. Failure to pay within time limit may result in being dropped from the class. Refunds will not be granted for any reason other than class cancellation. If you have any questions please contact us at discovery.series@gmail.com. Thank you."];
 

    NSArray *array = [[NSArray alloc] initWithObjects:gt0, gt00, gt1, gt2, gt3, gt4, gt5, nil];
    
    
    
    
    
    return array;
}


@end
