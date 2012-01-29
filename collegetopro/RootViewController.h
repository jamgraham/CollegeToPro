//
//  RootViewController.h
//  collegetopro
//
//  Created by James Graham on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

@interface RootViewController : UITableViewController <UINavigationControllerDelegate>
{
    NSDictionary *deserializedData;
}

@property (nonatomic,retain) NSDictionary *deserializedData;
@end
