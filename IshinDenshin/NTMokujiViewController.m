//
//  NTMokujiViewController.m
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/12.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTMokujiViewController.h"

#import "NTAppDelegate.h"
#import "NTToolbar.h"
#import "NTSerifu2ViewController.h"
#import "NTTableViewCell_1.h"
#import "NTTableViewCell_2.h"
#import <AVFoundation/AVFoundation.h>
#import "NTAudioRecorder.h"

@interface NTMokujiViewController ()
{

@private

	NTAudioRecorder *audioRec;
	
	NSTimer *timer_Rocord;
	
}

@end

@implementation NTMokujiViewController

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
    	
	//self.tableView.allowsMultipleSelection = NO;
	
	// テーブルデリを設定
	self.tableView.delegate = self;
		
	
	self.navigationItem.title = @"タイトル";
	
	//self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	/*UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
																			   target: self
																			   action: @selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;*/

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
																			   target: self
																			   action: @selector(insertNewObject:)];
	
	/*UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemCamera
																				target: self
																				action: @selector(cancel:)];*/
	UIBarButtonItem *editButton = self.editButtonItem;
	
	editButton.style = UIBarButtonItemStyleBordered;
	
	UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	
	NTToolbar *toolbar = [[NTToolbar alloc] initWithFrame: CGRectMake( 0.0f, 0.0f, 110.0f, 44.0f )];
	
	toolbar.backgroundColor = [UIColor clearColor];
	toolbar.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	
	UIBarButtonItem *toolbarBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:toolbar];

	toolbar.items = [NSArray arrayWithObjects:space, editButton, addButton, nil];
	
	self.navigationItem.rightBarButtonItem = toolbarBarButtonItem;
	
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];

}

- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{

    return 3;

}

- (NSInteger)tableView: (UITableView *)tableView
 numberOfRowsInSection: (NSInteger)section
{

	if ( section == 0 ) {
		
		return 2;
		
	} else if ( section == 1 ) {
		
		NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

		return [app.array_Mokuji count];
		
	} else if ( section == 2 ) {
		
		NTAppDelegate *app = [[UIApplication sharedApplication] delegate];
		
		return [app.array_Original count];
		
	} else {
		
		return 0;
		
	}
	
}

- (UITableViewCell *)tableView: (UITableView *)tableView
		 cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    
	if ( indexPath.section == 0 ) {
		
		if ( indexPath.row == 0 ) {
			
			NTTableViewCell_1 *cell_1 = [tableView dequeueReusableCellWithIdentifier: @"Cell_Rokuon"
																		forIndexPath: indexPath];
			
			cell_1.switch_Rokuon.on = NO;
			
			NTAppDelegate *app = [[UIApplication sharedApplication] delegate];
			
			app.bool_Rokuon = NO;
			
			return cell_1;

		} else if ( indexPath.row == 1 ) {
			
			NTTableViewCell_2 *cell_2 = [tableView dequeueReusableCellWithIdentifier: @"Cell_Saisei"
																		forIndexPath: indexPath];
			
			return cell_2;
			
		}
		
	} else if ( indexPath.section == 1 ) {
		
		UITableViewCell *cell_2 = [tableView dequeueReusableCellWithIdentifier: @"Cell_"
																  forIndexPath: indexPath];
		
		NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

		NSDictionary *dir = [app.array_Mokuji objectAtIndex: indexPath.row];
		
		cell_2.textLabel.text = [dir objectForKey: @"title"];
		
		return cell_2;
		
	} else if ( indexPath.section == 2 ) {
		
		UITableViewCell *cell_3 = [tableView dequeueReusableCellWithIdentifier: @"Cell_"
																  forIndexPath: indexPath];
		
		NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

		cell_3.textLabel.text = [app.array_Original objectAtIndex: indexPath.row];

		return cell_3;
		
	}

    return nil;
	
}

- (void)tableView: (UITableView *)tableView
  willDisplayCell: (UITableViewCell *)cell
forRowAtIndexPath: (NSIndexPath *)indexPath
{
	
}

- (void)insertNewObject:(id)sender
{
	
    /*if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];*/
	
}

- (BOOL)    tableView: (UITableView *)tableView
canEditRowAtIndexPath: (NSIndexPath *)indexPath
{

	if ( indexPath.section == 0 ) {
		
		return NO;
		
	} else if ( indexPath.section == 1 ) {
		
		return NO; //YES;
		
	} else if ( indexPath.section == 2 ) {
		
		return NO; //YES;
		
	}
	
    return NO;

}

- (void) tableView: (UITableView *)tableView
commitEditingStyle: (UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath: (NSIndexPath *)indexPath
{

	
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // [mokuji removeObjectAtIndex: indexPath.row];
        // [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }

}

- (NSIndexPath *)tableView: (UITableView *)tableView
  willSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
	
	NSInteger section = indexPath.section;
	NSInteger row     = indexPath.row;
	
	//NSLog( @"willSelect = %d", section );
	
	if ( section == 0 ) {

		if ( row == 0 ) {

			return nil;

		} else if ( row == 1 ) {
			
			return indexPath;
			
		}
		
	} else if ( section == 1 ) {
		
		return indexPath;
		
	} else if ( section == 2 ) {
		
		return indexPath;

	}
	
	//NSLog( @"return = nil" );
	
	return nil;

}

- (void)prepareForSegue: (UIStoryboardSegue *)segue
				 sender: (id)sender
{

	/*NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
	NSInteger section = indexPath.section;
	NSInteger row     = indexPath.row;
	
	if ( section == 0 ) {
		
	} else if ( section == 1 ) {
		
		id tanmatu = [segue destinationViewController];
		
		[tanmatu setDetailItem: array_Mokuji[row]];
		
	} else if ( section == 2 ) {
		
	}*/
	
	if ( [[segue identifier] isEqualToString: @"showDetail_1"] ) {
	
	} else if ( [[segue identifier] isEqualToString: @"showDetail_2"] ) {
		
		id tanmatu = [segue destinationViewController];
		
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		
		NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

		NSDictionary *dir = [app.array_Mokuji objectAtIndex: indexPath.row];
		
		app.string_Mokuji = [dir objectForKey: @"title"];

		[tanmatu setDetailItem: app.string_Mokuji];
		
	}

}

- (void)      tableView: (UITableView *)tableView
didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    
	/*[self performSegueWithIdentifier: @"showDetail"
	 sender: [NSString stringWithFormat:@"%d", indexPath.row + 1]];*/
	
}

- (IBAction)rokuon_Action:(id)sender
{

	UISwitch *switch_rokuon = (UISwitch *)sender;
	
	if ( switch_rokuon.on == YES ) {

		audioRec = [[NTAudioRecorder alloc] init];
		
		[audioRec record];
		
		timer_Rocord = [NSTimer scheduledTimerWithTimeInterval: 1.0f
														target: self
													  selector: @selector(rokuon_Timer:)
													  userInfo: nil
													   repeats: YES];
						  
	} else {
		
		[audioRec stop];
		
		NSDate *now_date = [NSDate new];
		
		NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
		
		dateForm.dateFormat = @"yyyyMMdd HHmmss";
		
		NSString *str_date = [dateForm stringFromDate: now_date];
		
		
	}
	
}

- (void)rokuon_Timer: (NSTimer*)timer
{

}

@end
