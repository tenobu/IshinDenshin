//
//  NTSerifu2ViewController.m
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/13.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTSerifu2ViewController.h"

#import "NTAppDelegate.h"
#import "NTToolbar.h"
#import "NTEditViewController.h"

@interface NTSerifu2ViewController ()
{
	
@private
	
	/*NSString *string_Link;

	NSString *string_Mokuji;
	NSArray *array_Serifu;*/
	
}

@end

@implementation NTSerifu2ViewController

- (id)initWithStyle: (UITableViewStyle)style
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
	
	NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

	[app setReadSerifu: app.string_Mokuji];
	
	
	
	
	
	
	
	
	/*NSBundle* bundle = [NSBundle mainBundle];
	
	//読み込むファイルパスを指定
	NSString *path = [bundle pathForResource: @"TitleSerifu"
									  ofType: @"plist"];
	
	// plistの読み込み
	NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile: path];
	
	// エラーをクリア
	BOOL bool_errorflag = YES;
	
	// Titleの読み込み
	for ( NSString *key in [dic allKeys] ) {

		if ( [key isEqualToString: string_Mokuji] ) {
	
			[self.navigationItem setTitle: string_Mokuji];
			
			NSArray *array = (NSArray *)[dic objectForKey: string_Mokuji];

			for ( id obj in array ) {
				
				// Dataの型を文字列に変換
				NSString *str = NSStringFromClass( [obj class] );
				
				// Dataの型を確認
				if ( [str isEqualToString: @"__NSCFArray"] ) {
					
					// NSArrayを入れる
					array_Serifu = (NSArray *)obj;
					
					break;
					
				}

			}
			
			[self.tableView reloadData];
			
			bool_errorflag = NO;

			continue;
			
		}
		
	}
	
	// エラー処理
	if ( bool_errorflag ) {
		
	}*/
	
	// テーブルデリを設定
	self.tableView.delegate = self;
	
	
	/*self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
																			   target: self
																			   action: @selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;*/

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
																			   target: self
																			   action: @selector(insertNewObject:)];
	
	UIBarButtonItem *editButton = self.editButtonItem;
	
	editButton.style = UIBarButtonItemStyleBordered;
	
	UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	
	NTToolbar *toolbar = [[NTToolbar alloc] initWithFrame: CGRectMake( 0.0f, 0.0f, 110.0f, 44.0f )];
	
	toolbar.backgroundColor = [UIColor clearColor];
	toolbar.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	
	UIBarButtonItem *toolbarBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:toolbar];
	
	toolbar.items = [NSArray arrayWithObjects:space, editButton, addButton, nil];
	
	self.navigationItem.rightBarButtonItem = toolbarBarButtonItem;

	/*[self.tableView setEditing: YES
					  animated: YES];
*/
}

- (void)didReceiveMemoryWarning
{
	
    [super didReceiveMemoryWarning];
	
}

- (void)setDetailItem: (NSString *)str
{

	NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

	app.string_Mokuji = str;

}

- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{
	
    return 1;
	
}

- (NSInteger)tableView: (UITableView *)tableView
 numberOfRowsInSection: (NSInteger)section
{
	
	NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

	return [app.array_Serifu count];
		
}

- (UITableViewCell *)tableView: (UITableView *)tableView
		 cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"Cell"
															forIndexPath: indexPath];
	
	NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

	cell.textLabel.text = [app.array_Serifu objectAtIndex: indexPath.row];
	
    return cell;
	
}

- (void)insertNewObject:(id)sender
{

	NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

	[app.array_Serifu insertObject: @"オリジナル"
						   atIndex: [app.array_Serifu count]];
	
	//NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	
	//[self.tableView insertRowsAtIndexPaths: @[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];*/

	[self.tableView reloadData];
	
}

- (BOOL)    tableView: (UITableView *)tableView
canEditRowAtIndexPath: (NSIndexPath *)indexPath
{
	
    return YES;
	
}

- (UITableViewCellEditingStyle)tableView: (UITableView *)tableView
		   editingStyleForRowAtIndexPath: (NSIndexPath *)indexPath
{

//	if (indexPath.row == 1) {
//
//		return UITableViewCellEditingStyleInsert;
//	
//	}
	
	return UITableViewCellEditingStyleDelete;

}

- (void) tableView: (UITableView *)tableView
commitEditingStyle: (UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath: (NSIndexPath *)indexPath
{
    
	if ( editingStyle == UITableViewCellEditingStyleDelete ) {
        
		NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

		[app.array_Serifu removeObjectAtIndex: indexPath.row];
       
		[self.tableView deleteRowsAtIndexPaths: [NSArray arrayWithObject: indexPath]
							  withRowAnimation: UITableViewRowAnimationFade];
    
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {

    }
	
}

- (NSIndexPath *)tableView: (UITableView *)tableView
  willSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
	
	//[self onnseiOutput: array_Serifu[indexPath.row]];
	
	return indexPath;
	
}

- (void)prepareForSegue: (UIStoryboardSegue *)segue
				 sender: (id)sender
{
	
	if ( [[segue identifier] isEqualToString: @"showEdit"] ) {
		
		id tanmatu = [segue destinationViewController];
		
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		
		NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

		app.string_Serifu = app.array_Serifu[indexPath.row];
		
		[tanmatu setMokuji: app.string_Mokuji
					serifu: app.string_Serifu];
		
	}
	
}

@end
