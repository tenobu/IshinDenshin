//
//  NTRokuonViewController.m
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/20.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTRokuonViewController.h"

#import "NTAppDelegate.h"

@interface NTRokuonViewController ()

@end

@implementation NTRokuonViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    
	self = [super initWithStyle:style];
    
	if (self) {
    
		// Custom initialization
    
	}
    
	return self;

}

- (void)viewDidLoad
{

    [super viewDidLoad];
    
	self.navigationItem.title = @"録音リスト";
 
}

- (void)didReceiveMemoryWarning
{
    
	[super didReceiveMemoryWarning];
    
	// Dispose of any resources that can be recreated.

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

	NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

    return [app.array_Rokuon count];

}

- (UITableViewCell *)tableView: (UITableView *)tableView
		 cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"Cell"
															forIndexPath: indexPath];
	
	NTAppDelegate *app = [[UIApplication sharedApplication] delegate];
	
	NSDictionary *dir = [app.array_Rokuon objectAtIndex: indexPath.row];
	
	cell.textLabel.text = [dir objectForKey: @"date_time"];
	
    return cell;
	
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
