//
//  StudentLeaves.m
//  PulseBrn
//
//  Created by Student on 26/07/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "StudentLeaves.h"
#import "SWRevealViewController.h"

@interface StudentLeaves ()

@end

@implementation StudentLeaves

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.slideButton setTarget: self.revealViewController];
        [self.slideButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
