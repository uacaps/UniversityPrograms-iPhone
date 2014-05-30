//
//  AppDelegate.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/29/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "AppDelegate.h"
#import "upcomingEventViewController.h"
#import "commentViewController.h"
#import "aboutUPViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //create the tab bar and set it to be the main view controller
    self.baseTabBar = [[UITabBarController alloc]init];
    [self.window setRootViewController:self.baseTabBar];
   
    
    //create the view controllers
    upcomingEventViewController *upcoming = [[upcomingEventViewController alloc] initWithNibName:NSStringFromClass([upcomingEventViewController class]) bundle:nil];
    aboutUPViewController *aboutUP = [[aboutUPViewController alloc] initWithNibName:NSStringFromClass([aboutUPViewController class]) bundle:nil];
    commentViewController *comments = [[commentViewController alloc]initWithNibName:NSStringFromClass([commentViewController class]) bundle:nil];
    UINavigationController *upcomingNav = [[UINavigationController alloc] initWithRootViewController:upcoming];
    UINavigationController *aboutUPNav = [[UINavigationController alloc] initWithRootViewController:aboutUP];
    UINavigationController *commentsNav = [[UINavigationController alloc] initWithRootViewController:comments];
    
    
    [self.baseTabBar setViewControllers:@[upcomingNav, aboutUPNav, commentsNav]];
    
    
    
   
    
    upcoming.title=@"Upcoming Events";
    aboutUP.title=@"About UP";
    comments.title=@"Comments";
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
