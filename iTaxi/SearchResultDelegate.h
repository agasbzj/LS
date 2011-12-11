//
//  SearchResultDelegate.h
//  iTaxi
//
//  Created by 中杰 卞 on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapHttpDelegate.h"
#import "SearchResultTableViewController.h"
@interface SearchResultDelegate : MapHttpDelegate <SearchResultDelegate> {
    NSArray *resultArray;
}

@end
