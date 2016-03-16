//
//  SecondViewController.m
//  NavigationControllerWithNib
//
//  Created by vinayganesh on 3/15/16.
//  Copyright © 2016 vinayganesh. All rights reserved.
//

#import "SecondViewController.h"
#import "LastViewController.h"
#import "Localytics.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set the title of the navigation view
    [self.navigationItem setTitle:@"My Second View"];
    
    //set the background color of the view
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    //for button tags
    int i = 1;
    
    // Show toolbar
    self.navigationController.toolbarHidden = NO;
    
    //Blank space to add between other items
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                  target:nil
                                  action:nil];
    
    //bar button item is a button specialized for placement on a UIToolbar
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                   target:self
                                   action:@selector(checkButtonClick:)];
    editButton.tag = i++;
    
    UIBarButtonItem *forwardButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
                                      target:self
                                      action:@selector(checkButtonClick:)];
    forwardButton.tag = i++;
    
    UIBarButtonItem *popView = [[UIBarButtonItem alloc]
                                initWithTitle:@"Pop this View"
                                style: UIBarButtonItemStylePlain
                                target:self
                                action:@selector(checkButtonClick:)];
    popView.tag = i++;
    
    //create an array of buttons
    NSArray *items = [NSArray arrayWithObjects:popView, editButton, itemSpace, forwardButton, nil];
    //add the buttons to the toolbar
    self.toolbarItems = items;
    
    
}

- (void) checkButtonClick:(id)sender {
    
    //get reference to the button that requested the action
    UIBarButtonItem *myButton = (UIBarButtonItem *)sender;
    NSLog(@"Clicked on one of the toolbar buttons");
    [Localytics tagEvent:@"Item Skipped"];
    [Localytics tagScreen:@"Item List"];
    
    //check which button it is, if you have more than one button on the screen
    //you must check before taking necessary action
    switch (myButton.tag) {
        case 1: {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Edit button Clicked"
                                                                           message:@"This is an alert."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
            break;
            
        case 2:
            
            //if the last view controller doesn't exists create it
            if(self.lastViewController == nil){
                LastViewController *lastView = [[LastViewController alloc] initWithNibName:@"LastController" bundle:nil];
                self.lastViewController = lastView;
            }
            
        {
            //customize the back button, you must set this before pushing the latest view into the stack
            UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle: @"Go Back"
                                                                           style: UIBarButtonItemStylePlain
                                                                          target: nil
                                                                          action: nil];
            
            [self.navigationItem setBackBarButtonItem: backButton];
        }
            
            //tell the navigation controller to push a new view into the stack
            [self.navigationController pushViewController:self.lastViewController animated:YES];
            break;
            
        case 3:
            //pop the current view from the stack
            [self.navigationController popViewControllerAnimated:YES];
            
        default:
            break;
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    //display navigation bar
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    //display toolbar
    self.navigationController.toolbarHidden = NO;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end