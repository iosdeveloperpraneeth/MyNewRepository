//
//  LocationOfBRN.m
//  PulseBrn
//
//  Created by Student on 04/08/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "LocationOfBRN.h"
#import "SWRevealViewController.h"
#import "PinView.h"

@interface LocationOfBRN ()

@end

@implementation LocationOfBRN

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sliderButton setTarget: self.revealViewController];
        [self.sliderButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    MKCoordinateRegion region = {{0.0,0.0},{0.0,0.0}};
    region.center.latitude = 17.450404;
    region.center.longitude = 78.387166;
    region.span.latitudeDelta = 0.01f;
    region.span.longitudeDelta = 0.01f;
    [self.mapView setRegion:region animated:YES];
    PinView * pin = [[PinView alloc]init];
    pin.title = @"BRN Info Tech.";
    pin.subTitleName = @"Hyderabad";
    pin.coordinate = region.center;
    [self.mapView addAnnotation:pin];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)segmentClicked:(id)sender
{
    if (self.selectMap.selectedSegmentIndex == 0)
    {
        self.mapView.mapType = MKMapTypeStandard;
    }
    else if (self.selectMap.selectedSegmentIndex == 1)
    {
        self.mapView.mapType = MKMapTypeSatellite;
    }
    else if (self.selectMap.selectedSegmentIndex == 2)
    {
        self.mapView.mapType = MKMapTypeHybrid;
    }
}
@end
