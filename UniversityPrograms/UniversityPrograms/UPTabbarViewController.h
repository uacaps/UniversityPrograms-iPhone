//
//  UPTabbarViewController.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/10/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYBlurIntroductionView.h"

@interface UPTabbarViewController : UITabBarController <UITabBarControllerDelegate, MYIntroductionDelegate>


-(void)buildIntroView;

@end
