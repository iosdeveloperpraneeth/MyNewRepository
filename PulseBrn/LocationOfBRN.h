//
//  LocationOfBRN.h
//  PulseBrn
//
//  Created by Student on 04/08/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface LocationOfBRN : UIViewController


@property (weak, nonatomic) IBOutlet UIBarButtonItem *sliderButton;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *selectMap;

- (IBAction)segmentClicked:(id)sender;


@end
