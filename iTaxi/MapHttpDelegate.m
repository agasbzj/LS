//
//  ASIHttpDelegate.m
//  iTaxi
//
//  Created by 中杰 卞 on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapHttpDelegate.h"
#import "MainViewController.h"

@implementation MKMapView(UltraMethods)
- (void)removeAnnotations {
    NSMutableArray *toRemove = [NSMutableArray arrayWithCapacity:10]; 
    for (id annotation in self.annotations) 
        if (annotation != self.userLocation) 
            [toRemove addObject:annotation];
    [self removeAnnotations:toRemove]; 
}
@end

@implementation MapHttpDelegate
@synthesize mapView = _mapView;
@synthesize mainController = _mainController;
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSURL *)itemDataFilePath {
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"google.plist"];
    NSLog(@"%@", storeURL);
    return storeURL;
}

- (id)initWithMap:(MKMapView *)mapView {
    self = [super init];
    if (self) {
        _mapView = mapView;
    }
    return self;
}


////Override this methode.
- (void)requestFinished:(ASIHTTPRequest *)request {
    
}

@end
