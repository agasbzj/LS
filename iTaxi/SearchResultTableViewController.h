//
//  SearchResultTableViewController.h
//  iTaxi
//
//  Created by 中杰 卞 on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SearchResultDelegate <NSObject>
- (void)resultSelected:(NSInteger)resultIndex;
@end
@interface SearchResultTableViewController : UITableViewController {
    NSArray *_data;
    NSInteger _resultIndex;
    id <SearchResultDelegate> searchResultDelegate;
}
@property (nonatomic, assign) id <SearchResultDelegate> searchResultDelegate;
- (id)initWithResults:(NSArray *)results;
@end
