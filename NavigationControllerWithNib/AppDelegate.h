//
//  AppDelegate.h
//  NavigationControllerWithNib
//
//  Created by vinayganesh on 3/15/16.
//  Copyright © 2016 vinayganesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) FirstViewController *firstViewController;

@end

