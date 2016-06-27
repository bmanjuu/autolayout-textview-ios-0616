//
//  ViewController.m
//  autolayoutTextview
//
//  Created by Betty Fung on 6/27/16.
//  Copyright © 2016 Betty Fung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //remove constraints for everything
        //superview
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    
        //textView
    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.textView.constraints];
    
        //bottomLeftButton
    self.bottomLeftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.bottomLeftButton.constraints];
    
        //bottomRightButton
    self.bottomRightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.bottomRightButton.constraints];
    
    
    
    //set anchors for stuff
        //buttons: both are 10pts from the bottom, and 10pts from the respective side/edge, use default width/height for buttons
        //USE NEGATIVE VALUES FOR CONSTANT IF DOING PADDING FROM THE RIGHT OR BOTTOM
    [self.bottomLeftButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.bottomLeftButton.topAnchor constraintEqualToAnchor:self.textView.bottomAnchor constant:20].active = YES;
    [self.bottomLeftButton.widthAnchor constraintEqualToAnchor:self.bottomLeftButton.widthAnchor].active = YES;
    [self.bottomLeftButton.heightAnchor constraintEqualToAnchor:self.bottomLeftButton.heightAnchor].active = YES;
    
    
    [self.bottomRightButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    [self.bottomRightButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
    [self.bottomRightButton.widthAnchor constraintEqualToAnchor:self.bottomRightButton.widthAnchor].active = YES;
    [self.bottomRightButton.heightAnchor constraintEqualToAnchor:self.bottomRightButton.heightAnchor].active = YES;
    
        //  alternative for space between textview and buttons:  [self.bottomRightButton.topAnchor constraintEqualToAnchor:self.textView.bottomAnchor constant:20].active = YES;
        //  [self.bottomLeftButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
    
    
        //textfield: 20pts from top, 10pts from left&right, 20pts from top of UIButtons
    
    [self.textView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active = YES;
    [self.textView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-20].active = YES;
    [self.textView.bottomAnchor constraintEqualToAnchor:self.bottomRightButton.topAnchor constant:-20].active = YES;
    
    
    
    
    //EXTRA CREDIT
//    In portrait mode, leave the padding between the UIButton and the UITextField at 20 pts. In landscape, decrease it 10 pts. Hint: you can listen for a rotation event and examine the new size class. Check out Joe's blog post for details.
//        On an iPhone 6 or 6+, increase make the padding between the UIButton and the UITextField to be 30 pts. Hint: more size classes!
    
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    
    float screenHeight = [[UIScreen mainScreen] bounds].size.height;
    float screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    if(screenWidth >= 375 && screenHeight >= 667){
        [self.textView.bottomAnchor constraintEqualToAnchor:self.bottomRightButton.topAnchor constant:-20].active = NO;
        [self.bottomRightButton.topAnchor constraintEqualToAnchor:self.textView.bottomAnchor constant:30].active = YES;
        [self.bottomLeftButton.topAnchor constraintEqualToAnchor:self.textView.bottomAnchor constant:30].active = YES;
        
    }
    
    if(screenWidth < 375 && screenHeight < 667 && UIDeviceOrientationIsLandscape(deviceOrientation)){
        [self.textView.bottomAnchor constraintEqualToAnchor:self.bottomRightButton.topAnchor constant:-20].active = NO;
        [self.bottomRightButton.topAnchor constraintEqualToAnchor:self.textView.bottomAnchor constant:10].active = YES;
        [self.bottomLeftButton.topAnchor constraintEqualToAnchor:self.textView.bottomAnchor constant:10].active = YES;
    }
    
    

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
