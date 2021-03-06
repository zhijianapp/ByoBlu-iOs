//
//  AppDelegate.m
//  byoblu
//
//  Created by Andrea Barbon on 06/01/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import "AppDelegate.h"
//#import "PayPal.h"

@implementation AppDelegate

@synthesize window, tabBarController, advertisements, TVStreaming;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
#ifdef TESTING
    NSLog(@"Testing mode");
    [TestFlight takeOff:@"6d8b535259723e3d563e7bc3ff9ce466_NTgyMzEyMDEyLTAxLTMxIDA2OjQ2OjIzLjcyNjE1MA"];
    [TestFlight setDeviceIdentifier:[[UIDevice currentDevice] uniqueIdentifier]];
    [TestFlight passCheckpoint:@"App started!"];
#endif
    

#ifdef AD
    NSLog(@"Ads enabled");
    advertisements = YES;
#endif 
    
#ifdef TV
    NSLog(@"TV enabled");
    TVStreaming = YES;
#endif     
    
    
    if (!TVStreaming) {
    
        NSMutableArray* newArray = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];
        [newArray removeObjectAtIndex:2];
        
        [self.tabBarController setViewControllers:newArray animated:YES];
    }
    
    
    
    
    //[PayPal initializeWithAppID:@"APP-80W284485P519543T" forEnvironment:ENV_SANDBOX];

    [self.window addSubview:self.tabBarController.view];
    [self.window makeKeyAndVisible];

    UIImageView *background = [[UIImageView alloc] init];//WithImage:[UIImage imageNamed:@"background_iPad.png"]];
    background.frame = self.window.frame;
    background.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    //[self.window addSubview:background];
    //[self.window sendSubviewToBack:background];
    
    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
