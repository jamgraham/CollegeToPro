//
//  RootViewController.m
//  collegetopro
//
//  Created by James Graham on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "CollegePlayersViewController.h"


@implementation RootViewController
@synthesize deserializedData;

- (void)viewDidLoad
{
    self.navigationItem.title = @"Colleges";
    
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
//    NSURL *url = [NSURL URLWithString:@"http://collegetopro.heroku.com/search/college"];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request startSynchronous];
//    NSError *error = [request error];
//    if (!error) {
//        NSString *response = [request responseString];
//        deserializedData = [response objectFromJSONString];
//        
        NSString *jsonUrl = @"http://collegetopro.heroku.com/search/college";
        NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:jsonUrl]];
        
        JSONDecoder *jsonKitDecoder = [JSONDecoder decoder];
        deserializedData = [[NSDictionary alloc] init];
        deserializedData = [jsonKitDecoder parseJSONData:jsonData];
        [deserializedData retain];
        NSLog(@"total items: %d", [deserializedData count]);

//    }
//    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

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
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSMutableArray *asdf = [deserializedData mutableArrayValueForKey:@"college"];
    NSMutableArray *college_name = [asdf mutableArrayValueForKey:@"college"];
    NSMutableArray *college_id = [asdf mutableArrayValueForKey:@"id"];
    NSString *cell_text = [[NSString alloc] initWithFormat:@"%@",[college_name objectAtIndex:indexPath.row]];
    // Configure the cell.
    cell.textLabel.text = cell_text;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
    
    NSMutableArray *asdf = [deserializedData mutableArrayValueForKey:@"college"];
    NSMutableArray *college_name = [asdf mutableArrayValueForKey:@"college"];
    NSMutableArray *college_id = [asdf mutableArrayValueForKey:@"id"];   
    
    
    CollegePlayersViewController *collegeViewControlller = [[CollegePlayersViewController alloc] init];
    collegeViewControlller.college_id =  [college_id objectAtIndex:indexPath.row];
    collegeViewControlller.college_name = [college_name objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:collegeViewControlller animated:YES];
    [collegeViewControlller release];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
