//
//  NTEditViewController.m
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/18.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTEditViewController.h"

@interface NTEditViewController ()
{
	
@private
	
	NSString *string_Mokuji, *string_Serifu;
	
	UIBarButtonItem *editButton;

}

@end

@implementation NTEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
	if (self) {
        // Custom initialization
    }
    
	return self;

}

- (void)viewDidLoad
{

    [super viewDidLoad];

	//self.navigationItem.rightBarButtonItem = self.editButtonItem;
	editButton = [[UIBarButtonItem alloc] initWithTitle: @"編集"
												  style: UIBarButtonItemStyleDone
												 target: self
												 action: @selector(editObject:)];
	
	self.navigationItem.rightBarButtonItem = editButton;
	
	self.textView_Edit.text = string_Serifu;
	
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)editObject: (id)sender
{

	if ( self.textView_Edit.editable == NO ) {
		
		self.textView_Edit.editable = YES;

		self.navigationItem.rightBarButtonItem.title = @"終了";
		
	} else {
		
		self.textView_Edit.editable = NO;
		
		self.navigationItem.rightBarButtonItem.title = @"編集";
		
		if ( [self.textView_Edit.text isEqualToString: string_Serifu] == NO ) {
		
			[self setEditEnd];
			
		}
		
	}
	
}

/*- (void)setDetailItem: (NSString *)str
{
	
	string_Serifu = str;
	
}*/

- (void)setMokuji: (NSString *)str_mokuji
		   serifu: (NSString *)str_serifu
{
	
	string_Mokuji = str_mokuji;
	string_Serifu = str_serifu;

}

- (void)setEditEnd
{
	
	
	//string_Serifu = str;
	
}

@end
