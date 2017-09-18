//
//  PinView.h
//  PulseBrn
//
//  Created by Student on 04/08/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PinView : NSObject <MKAnnotation>

@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * subTitleName;
@property (nonatomic,assign)CLLocationCoordinate2D coordinate;

@end
