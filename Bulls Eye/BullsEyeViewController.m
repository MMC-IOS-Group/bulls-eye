//
//  BullsEyeViewController.m
//  Bulls Eye
//
//  Created by Mark Tareshawty on 10/15/12.
//  Copyright (c) 2012 MMC IOS Group. All rights reserved.
//

#import "BullsEyeViewController.h"
#import "AboutViewController.h"

@interface BullsEyeViewController ()

@end

@implementation BullsEyeViewController
{
    int currentValue;
    int targetValue;
    int score;
    int round;
}

@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;

-(void)startNewRound
{
    round += 1;
    targetValue = 1 + (arc4random() % 100);
    currentValue = 50;
    self.slider.value = currentValue;
}

- (void)startNewGame
{
    score = 0;
    round = 0;
    [self startNewRound];
}

-(void)startOver
{
    [self startNewGame];
    [self updateLabels];
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];
}

- (void)viewDidLoad
{
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb Highlighted"];
                                      [self.slider setThumbImage:thumbImageHighlighted forState:
                                       UIControlStateHighlighted];
                                      UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"]
                                                                 stretchableImageWithLeftCapWidth:14 topCapHeight:0];
                                      [self.slider setMinimumTrackImage:trackLeftImage forState:
                                       UIControlStateNormal];
                                      UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"]
                                                                  stretchableImageWithLeftCapWidth:14 topCapHeight:0];
                                      [self.slider setMaximumTrackImage:trackRightImage forState:
                                       UIControlStateNormal];
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Make sure the layout is always portrait
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

// Alert when you push the button
-(IBAction)showAlert
{
    int difference = abs(targetValue - currentValue);
    int points = 100 - difference;
    score += points;
        
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
    } else if (difference < 5) {
        title = @"You almost had it!";
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    
    NSString *message = [NSString stringWithFormat: @"You scored %d points", points];
    // This part did not change:
    UIAlertView *alertView = [[UIAlertView alloc]
                                initWithTitle:title
                                message:message
                                delegate:nil
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil];
    [alertView show];
    [self startNewRound];
    [self updateLabels];
}

// Change a label to for the value of the slider
- (IBAction)sliderMoved:(UISlider *)sender
{
    currentValue = lroundf(sender.value);
}

-(IBAction)showInfo
{
    AboutViewController *controller = [[AboutViewController alloc]
                                       initWithNibName:@"AboutViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}
@end
