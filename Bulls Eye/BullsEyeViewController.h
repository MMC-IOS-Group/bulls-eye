//
//  BullsEyeViewController.h
//  Bulls Eye
//
//  Created by Mark Tareshawty on 10/15/12.
//  Copyright (c) 2012 MMC IOS Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullsEyeViewController : UIViewController

// Declare our UI elements
@property (nonatomic, strong) IBOutlet UISlider *slider;
@property (nonatomic, strong) IBOutlet UILabel *targetLabel;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) IBOutlet UILabel *roundLabel;

// Our method when we press the "Hit Me!" button
-(IBAction)showAlert;

// Method for the Slider
- (IBAction)sliderMoved:(UISlider *)sender;

// Start our game over
-(IBAction)startOver;

// Info View
- (IBAction)showInfo;
@end
