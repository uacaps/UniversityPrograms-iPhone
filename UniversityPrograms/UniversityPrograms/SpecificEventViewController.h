//
//  SpecificEventViewController.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "UPViewController.h"
@interface SpecificEventViewController : UPViewController <UIScrollViewDelegate>

-(instancetype)initWithEvent:(Event *)event;
@end
