//
//  LongpressDelegate.m
//  iTaxi
//
//  Created by 中杰 卞 on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "LongpressDelegate.h"
#import "MainViewController.h"

@implementation LongpressDelegate
@synthesize anno = _anno;
- (id)initWithMap:(MKMapView *)mapView annotation:(PlaceAnnotation *)anno {
    self = [super initWithMap:mapView];
    if (self) {
        _anno = anno;
    }
    return self;
}
- (void)requestFinished:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    if (!error) {
        NSString *responseString = [request responseString];
        NSLog(@"%@", responseString);
        NSData *responseData = [request responseData];
        NSDictionary *dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData error:NULL];
        [dict writeToURL:[self itemDataFilePath] atomically:YES];
        
        if ([[dict valueForKey:@"results"] count]) {
            NSString *add = [[[dict valueForKey:@"results"] objectAtIndex:0] valueForKey:@"formatted_address"];
            _mainController.formattedAddress = [add retain];
            _anno.address = add;
            _anno.subtitle = add;
            _anno.title = @"用户选择的地点";
            [_mapView removeAnnotations];
            //            [_mapView removeAnnotations:_mapView.annotations];
            [_mapView addAnnotation:_anno];
            [_anno release];
        }
    }
    [self release];
}
@end
