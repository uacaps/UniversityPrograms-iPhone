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
    return [UIColor colorWithRed:50.0/255.0f green:50.0/255.0f blue:50.0/255.0f alpha:1];
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
+(UIColor *)UPCrimsonColor{
    return [UIColor colorWithRed:220.0/255.0f green:20.0/255.0f blue:60.0/255.0f alpha:1];
}

+(NSInteger)getThemeColorIndex{
    
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"colorSelection"];
}
+(void)setThemeColor:(UIColor *)color{
    NSString *colorString = [CIColor colorWithCGColor:color.CGColor].stringRepresentation;
    [[NSUserDefaults standardUserDefaults] setValue:colorString forKey:@"themeColor"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}
+(UIColor *)getThemeColor{
    
    //UIColor *themeColor= [[UIColor alloc] initWithRed:[[NSUserDefaults standardUserDefaults] floatForKey:@"red"] green:[[NSUserDefaults standardUserDefaults] floatForKey:@"green"] blue:[[NSUserDefaults standardUserDefaults] floatForKey:@"blue"] alpha:[[NSUserDefaults standardUserDefaults] floatForKey:@"alpha"]];
    CIColor *color = [CIColor colorWithString:[[NSUserDefaults standardUserDefaults] stringForKey:@"themeColor"]];
    UIColor *conversionColor = [[UIColor alloc]initWithCIColor:color];
    UIColor *themeColor = [[UIColor alloc] initWithCGColor:conversionColor.CGColor];
    
    return (UIColor *)themeColor;
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
+(UIColor *)getTextColor{
    UIColor *textColor;
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"darkMode"]){
        textColor=[UIColor whiteColor];
    }
    else{
        textColor=[UIColor darkGrayColor];
    }
    return textColor;
}
@end
