#import "FirstViewController.h"
#import "Localytics.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize secondViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set the title of the navigation view
    [self.navigationItem setTitle:@"My First View"];
    
    //set the background color of the view
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //create a right side button in the navigation bar
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithTitle:@"Next View"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(nextScreen:)];
    [self.navigationItem setRightBarButtonItem:myButton];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.toolbarHidden = YES;
    [super viewWillAppear:animated];
}

- (void) nextScreen:(id)sender {
    
    //get reference to the button that requested the action
    UIBarButtonItem *myButton = (UIBarButtonItem *)sender;
    
    //check which button it is, if you have more than one button on the screen
    //you must check before taking necessary action
    if([myButton.title isEqualToString:@"Next View"]) {
        NSLog(@"Clicked on the bar button");
        [Localytics tagEvent:@"Item Skipped"];
        [Localytics tagScreen:@"Item List"];
        
        //if the second view controller doesn't exists create it
        if(self.secondViewController == nil){
            SecondViewController *secondView = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
            self.secondViewController = secondView;
        }
        
        //tell the navigation controller to push a new view into the stack
        [self.navigationController pushViewController:self.secondViewController animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end