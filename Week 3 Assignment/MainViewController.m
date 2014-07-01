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
@property (weak, nonatomic) IBOutlet UIScrollView *mainView;
- (IBAction)onHeadlinePan:(id)sender;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *headlinePan;
@property (strong, nonatomic) IBOutlet UIView *appView;
@property (weak, nonatomic) IBOutlet UIImageView *headlineView;

@property CGPoint startLocation;
@property CGPoint lastChangedLocation;

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
    self.headlineView.userInteractionEnabled = YES;
    self.mainView.contentSize = CGSizeMake(320, 2000);
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden { return YES; }

- (IBAction)onHeadlinePan:(id)sender {
//    return;
    if (self.headlinePan.state == UIGestureRecognizerStateBegan) {
        self.startLocation = [self.headlinePan locationInView:self.appView];
        self.lastChangedLocation = self.startLocation;
    } else if (self.headlinePan.state == UIGestureRecognizerStateChanged) {
        CGFloat difference = [self.headlinePan locationInView:self.appView].y;
        if (self.mainView.frame.origin.y < -30) {
            difference *= 1.005;
        }
        self.mainView.center = CGPointMake(self.mainView.center.x, self.mainView.center.y + (difference- self.lastChangedLocation.y));
        self.lastChangedLocation = [self.headlinePan locationInView:self.appView];
    } else if (self.headlinePan.state == UIGestureRecognizerStateEnded) {
        // Swiped down
        if ([self.headlinePan locationInView:self.appView].y > self.startLocation.y) {
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
                self.mainView.center = CGPointMake(self.mainView.center.x, 800);
            } completion:nil];
        // Swiped up
        } else if ([self.headlinePan locationInView:self.appView].y < self.startLocation.y) {
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
                self.mainView.center = CGPointMake(self.mainView.center.x, 284);
            } completion:nil];
        // Nothing
        } else {
            
        }
    }
}

@end
