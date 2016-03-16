//
//  AppDelegate.m
//  NavigationControllerWithNib
//
//  Created by vinayganesh on 3/15/16.
//  Copyright © 2016 vinayganesh. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "Localytics.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Intialize the localytics
    [self initializeLocalytics:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //create the navigation controller and add the controllers view to the window
    self.navigationController = [[UINavigationController alloc] init];
    [self.window addSubview:[self.navigationController view]];
    
    //check if the first viewcontroller eixsts, otherwise create it
    if(self.firstViewController == nil)
    {
        FirstViewController *firstView = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
        self.firstViewController = firstView;
    }
    
    //push the first viewcontroller into the navigation view controller stack
    [self.navigationController pushViewController:self.firstViewController animated:YES];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self.window setRootViewController:self.navigationController];
    
    return YES;
}

-(void)initializeLocalytics:(NSDictionary*)launchOptions {
    [Localytics autoIntegrate:@"YOUR APP KEY" launchOptions:launchOptions];
    [Localytics setCustomerFirstName:@"Teller"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    //do nothing
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    //do nothing
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    //do nothing
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    //do nothing
}

- (void)applicationWillTerminate:(UIApplication *)application {
    //do nothing
}

@end
