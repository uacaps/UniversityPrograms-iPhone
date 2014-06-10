//
//  UIColor+UPColors.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/4/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UIColor+UPColors.h"


@implementation UIColor (UPColors)

+(UIColor *)UPDarkGreyColor{
    return [UIColor colorWithRed:63.0/255.0f green:63.0/255.0f blue:63.0/255.0f alpha:1];
}

+(UIColor *)UPSecondaryColor{
    return [UIColor colorWithRed:228.0/255.0f green:82.0/255.0f blue:82.0/255.0f alpha:1];
}

+(UIColor *)UPPrimaryColor{
    return [UIColor colorWithRed:142.0/255.0f green:133.0/255.0f blue:82.0/255.0f alpha:1];
}

+(UIColor *)UPPlumColor{
    return [UIColor colorWithRed:150.0/255.0f green:16.0/255.0f blue:77.0/255.0f alpha:1];
}

+(UIColor *)UPTealColor{
    return [UIColor colorWithRed:141.0/255.0f green:205.0/255.0f blue:189.0/255.0f alpha:1];
}
+(UIColor *)UPPeachColor{
    return [UIColor colorWithRed:244.0/255.0f green:118.0/255.0f blue:103.0/255.0f alpha:1];
}
+(void)setThemeColorIndex:(int)index{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"alreadyRan"]){
        [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"colorSelection"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"colorSelection"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"alreadyRan"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(int)getThemeColorIndex{
    
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"colorSelection"];
}
+(UIColor *)getThemeColor{
    int index = [[NSUserDefaults standardUserDefaults] integerForKey:@"colorSelection"];
    UIColor *themeColor;
    if(index==0){
        themeColor=[UIColor brickRedColor];
    }else if(index==1){
        themeColor=[UIColor grassColor];
    }
    else if(index==2){
        themeColor=[UIColor tealColor];
    }else{
        themeColor=[UIColor goldenrodColor];
    }
    return themeColor;
}
+(UIColor *)getStyleColor{
    UIColor *styleColor;
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"darkMode"]){
        styleColor=[UIColor UPDarkGreyColor];
    }
    else{
        styleColor=[UIColor whiteColor];
    }
    return styleColor;
}

@end
