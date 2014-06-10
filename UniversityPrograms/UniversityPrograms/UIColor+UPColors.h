//
//  UIColor+UPColors.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/4/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colours.h"


@interface UIColor (UPColors)
+(UIColor *)UPDarkGreyColor;
+(UIColor *)UPSecondaryColor;
+(UIColor *)UPPrimaryColor;
+(UIColor *)UPPlumColor;
+(UIColor *)UPTealColor;
+(UIColor *)UPPeachColor;
+(UIColor *)getThemeColor;
+(int)getThemeColorIndex;
+(void)setThemeColorIndex:(int)index;
+(UIColor *)getStyleColor;
@end
