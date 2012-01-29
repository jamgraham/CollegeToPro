//
//  CollegePlayersViewController.m
//  collegetopro
//
//  Created by James Graham on 1/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CollegePlayersViewController.h"

@implementation CollegePlayersViewController
@synthesize college_id, deserializedData, college_name;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = self.college_name;
    
    //        
    NSString *jsonUrl = [[NSString alloc] initWithFormat: @"http://collegetopro.heroku.com/search_players?college_id=%@",self.college_id];
    
    NSLog(@"url to pulll down %@",jsonUrl);
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:jsonUrl]];
    JSONDecoder *jsonKitDecoder = [JSONDecoder decoder];
    deserializedData = [[NSDictionary alloc] init];
    deserializedData = [jsonKitDecoder parseJSONData:jsonData];
    [deserializedData retain];
    NSLog(@"total items: %d", [deserializedData count]);
    
    
}


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection total items: %d", [deserializedData count]);
    
    return [deserializedData count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"cellForRowAtIndexPath total items: %d", [deserializedData count]);
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSMutableArray *asdf = [deserializedData mutableArrayValueForKey:@"player"];
    NSMutableArray *college_name = [asdf mutableArrayValueForKey:@"name"];
    NSMutableArray *position_id = [asdf mutableArrayValueForKey:@"position_id"];
    NSString *cell_text = [[NSString alloc] initWithFormat:@"%@",[college_name objectAtIndex:indexPath.row]];
    // Configure the cell.
    cell.textLabel.text = cell_text;
    
    return cell;
}

- (void)viewDidUnload
{
    
    [college_name release];
    [college_id release];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
