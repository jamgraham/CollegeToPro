//
//  CollegePlayersViewController.h
//  collegetopro
//
//  Created by James Graham on 1/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

@interface CollegePlayersViewController : UIViewController
{
    NSString *college_id;    
    NSString *college_name;
    NSDictionary *deserializedData;
}

@property (nonatomic, retain) NSString *college_id;
@property (nonatomic,retain) NSDictionary *deserializedData;
@property (nonatomic, retain) NSString *college_name;


@end
