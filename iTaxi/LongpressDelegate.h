//
//  LongpressDelegate.h
//  iTaxi
//
//  Created by 中杰 卞 on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapHttpDelegate.h"

@interface LongpressDelegate : MapHttpDelegate
@property (nonatomic, retain) PlaceAnnotation *anno;
- (id)initWithMap:(MKMapView *)mapView annotation:(PlaceAnnotation *)anno;
@end
