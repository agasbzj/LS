//
//  SearchResultDelegate.m
//  iTaxi
//
//  Created by 中杰 卞 on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "SearchResultDelegate.h"
#import "MainViewController.h"
@interface SearchResultDelegate() {
    NSArray *resultArray;
}
- (void)setResultAnnotation:(NSInteger)index;
@end
@implementation SearchResultDelegate


- (void)requestFinished:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    if (!error) {
        [_mapView removeAnnotations];
        //        [self.mapView removeAnnotations:self.mapView.annotations];
        // Use when fetching text data
        NSString *responseString = [request responseString];
        NSLog(@"%@", responseString);
        // Use when fetching binary data
        NSData *responseData = [request responseData];
        NSDictionary *dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData error:NULL];
        [dict writeToURL:[self itemDataFilePath] atomically:YES];
        NSArray *array = [dict valueForKey:@"results"];
        resultArray = array;
        for (NSDictionary *dic in array) {
            
            PlaceAnnotation *anno = [[PlaceAnnotation alloc] init];
            anno.title = [[[dic valueForKey:@"address_components"] objectAtIndex:0] valueForKey:@"long_name"];
            anno.subtitle = [dic valueForKey:@"formatted_address"];
            anno.address = [dic valueForKey:@"formatted_address"];
            NSDictionary *loc = [[dic valueForKey:@"geometry"] valueForKey:@"location"];
            anno.coordinate = CLLocationCoordinate2DMake([[loc valueForKey:@"lat"] doubleValue], [[loc valueForKey:@"lng"] doubleValue]);
            [_mapView addAnnotation:anno];
            [anno release];
        }
        
        if ([array count] == 1) {
//            _mainController.formattedAddress = [[[array objectAtIndex:0] valueForKey:@"formatted_address"] retain];
            [self setResultAnnotation:0];
            
        }
        else if ([array count] > 1){
            //显示所有地址以供用户选择。。。
            SearchResultTableViewController *tableViewController = [[SearchResultTableViewController alloc] initWithResults:resultArray];
            [_mainController presentModalViewController:tableViewController animated:YES];
            [tableViewController release];
            
        }
        else {
        
        }
        //_searchBar.hidden = YES;
        
    }
    else {
        NSLog(@"Request finished:%@", [error localizedDescription]);
    }

}

- (void)setResultAnnotation:(NSInteger)index {
    NSDictionary *dic = [resultArray objectAtIndex:index];
    PlaceAnnotation *anno = [[PlaceAnnotation alloc] init];
    anno.title = [[[dic valueForKey:@"address_components"] objectAtIndex:0] valueForKey:@"long_name"];
    anno.subtitle = [dic valueForKey:@"formatted_address"];
    anno.address = [dic valueForKey:@"formatted_address"];
    NSDictionary *loc = [[dic valueForKey:@"geometry"] valueForKey:@"location"];
    anno.coordinate = CLLocationCoordinate2DMake([[loc valueForKey:@"lat"] doubleValue], [[loc valueForKey:@"lng"] doubleValue]);
    [_mapView addAnnotation:anno];
    [anno release];
    _mainController.formattedAddress = [[[resultArray objectAtIndex:index] valueForKey:@"formatted_address"] retain];
}

#pragma mark - SearchResultDelegate
- (void)resultSelected:(NSInteger)resultIndex {
    [self setResultAnnotation:resultIndex];
}

@end
