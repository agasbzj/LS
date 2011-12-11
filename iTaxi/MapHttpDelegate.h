//
//  ASIHttpDelegate.h
//  iTaxi
//
//  Created by 中杰 卞 on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ASIHTTPRequest.h"
#import "CJSONDeserializer.h"
#import "PlaceAnnotation.h"

@class MainViewController;
@interface MapHttpDelegate : NSObject {
@protected
    MKMapView *_mapView;
    MainViewController *_mainController;
}
@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, assign) MainViewController *mainController;
- (id)initWithMap:(MKMapView *)mapView;
- (NSURL *)applicationDocumentsDirectory;
- (NSURL *)itemDataFilePath;
- (void)requestFinished:(ASIHTTPRequest *)request;
@end

@interface MKMapView(UltraMethods)
- (void)removeAnnotations;
@end