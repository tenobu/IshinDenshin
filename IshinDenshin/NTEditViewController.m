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

	// 読み込むファイルパスを指定
	/*NSString *path = [bundle pathForResource:@"TitleSerifu" ofType:@"plist"];
	
	// plistの読み込み
	NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile: path];
	
	// エラーをクリア
	BOOL bool_errorflag = YES;
	
	// Titleの読み込み
	for ( NSString *key in [dic allKeys] ) {
		
		// dirの初期化
		NSMutableDictionary *dir_data = [[NSMutableDictionary alloc] init];
		
		// TitleDataのarray
		NSArray *array = (NSArray *)[dic objectForKey: key];
		
		// TitleDataの読み込み
		for ( id obj in array ) {
			
			// Dataの型を文字列に変換
			NSString *str = NSStringFromClass( [obj class] );
			
			// Dataの型を確認
			//if ( [NSStringFromClass( [obj class] ) isEqualToString: @"NSNumber"] ) {
			// 思った通りにNSNumberにならない
			if ( [str isEqualToString: @"__NSCFNumber"] ) {
				
				//NSNumber *number = obj;
				
				// 順番を足す
				[dir_data setObject: obj forKey: @"jyunban"];
				
				break;
				
			}
			
		}
		
		// Titleを足す
		[dir_data setObject: key forKey: @"title"];
		
		// dir_dataを足す
		[array_Mokuji addObject: dir_data];
		
	}*/
	
	
}

@end
