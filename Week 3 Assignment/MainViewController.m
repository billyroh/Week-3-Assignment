//
//  MainViewController.m
//  Week 3 Assignment
//
//  Created by Billy Roh on 6/30/14.
//  Copyright (c) 2014 Billy Roh. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *storyStripScrollView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
- (IBAction)onHeadlinePan:(id)sender;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *headlinePan;
@property CGPoint startLocation;
@property (strong, nonatomic) IBOutlet UIView *appView;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.storyStripScrollView.contentSize = CGSizeMake(2570, 253);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHeadlinePan:(id)sender {
    NSLog(@"panning");
    if (self.headlinePan.state == UIGestureRecognizerStateBegan) {
        NSLog(@"starting");
        self.startLocation = [self.headlinePan locationInView:self.appView];
    } else if (self.headlinePan.state == UIGestureRecognizerStateEnded) {
        NSLog(@"ended");
        // Swiped down
        if ([self.headlinePan locationInView:self.appView].y > self.startLocation.y) {
            self.mainView.center = CGPointMake(self.mainView.center.x, 300);
            
        // Swiped up
        } else if ([self.headlinePan locationInView:self.appView].y < self.startLocation.y) {
            
        // Nothing
        } else {
            
        }
    }
}

@end
