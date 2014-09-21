//
//  NTEditViewController.m
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/18.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTEditViewController.h"

#import "NTAppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@interface NTEditViewController ()
{
	
@private
	
	NSString *string_Mokuji, *string_Serifu;
	
	UIBarButtonItem *editButton;
	
	AVSpeechSynthesizer *speechSynthesizer;

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

	self.navigationItem.title = @"台詞";

	//self.navigationItem.rightBarButtonItem = self.editButtonItem;
	editButton = [[UIBarButtonItem alloc] initWithTitle: @"編集"
												  style: UIBarButtonItemStyleDone
												 target: self
												 action: @selector(editObject:)];
	
	self.navigationItem.rightBarButtonItem = editButton;
	
	self.textView_Edit.text = string_Serifu;

	// 音声合成を初期化
	speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
	

//	NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
//    // キーボード表示時
//    [notification addObserver:self selector:@selector(keyboardWillShow:)
//						 name: UIKeyboardWillShowNotification object:nil];
//    // キーボード非表示時
//	[notification addObserver:self selector:@selector(keyboardWillHide:)
//						 name: UIKeyboardWillHideNotification object:nil];

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

//- (void)keyboardWillShow:(NSNotification *)notificatioin
//{
//    // ここでTextFieldやTextViewの位置を変更する
//    NSLog(@"keyboardWillShow");
//    
//    // キーボードに合わせたアニメーション処理
//    [UIView animateWithDuration:0.3f
//                     animations:^{
//                         
//                         // TextFieldのframe
//                         CGRect viewRect  = self.textView_Edit.frame;
//                         
//                         // キーボードのサイズを取得
//                         CGRect keybord;
//                         [[notificatioin.userInfo valueForKey: UIKeyboardBoundsUserInfoKey] getValue: &keybord];
//                         
//                         // TextFieldの位置から(元のY座標+TextViewの高さ) - (Viewの高さ - キーボード)分、上げる(マイナスする)
//                         viewRect.origin.y -= ((266.0f+viewRect.size.height)-(self.view.frame.size.height - keybord.size.height));
//                         self.textView_Edit.frame = viewRect;
//                     }];
//}
//
///*
// *  キーボード非表示
// */
//- (void)keyboardWillHide:(NSNotification *)notificatioin
//{
//    // ここでTextFieldやTextViewの位置を戻す
//    NSLog(@"keyboardWillHide");
//    
//    // キーボードに合わせたアニメーション処理
//    [UIView animateWithDuration:0.3f
//                     animations:^{
//                         
//                         // TextFieldのframe
//                         CGRect viewRect  = self.textView_Edit.frame;
//                         
//                         // TextFieldのY座標を元の位置に定義
//                         viewRect.origin.y = 266.0f;
//                         self.textView_Edit.frame = viewRect;
//                     }];
//}

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

	NTAppDelegate *app = [[UIApplication sharedApplication] delegate];
	
	NSString *str_old = app.string_Serifu;
	NSString *str_new = self.textView_Edit.text;
	
	[app setNewSerifu: str_new];
	
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

- (IBAction)button_Action:(id)sender
{

	[self onnseiOutput: self.textView_Edit.text];
	
}

- (void)onnseiOutput: (NSString *)string
{
	
	//NSLog(@"%@", string);
	
	AVSpeechUtterance      *utterance = [AVSpeechUtterance speechUtteranceWithString: string];
	AVSpeechSynthesisVoice *JVoice    = [AVSpeechSynthesisVoice voiceWithLanguage: @"ja-JP"];
	
	// 音声の日本語化
	utterance.voice =  JVoice;
	
	// NSLog( @"bool_AudioResult == %d", bool_AudioResult );
	
	// 音声の発生
	[speechSynthesizer speakUtterance: utterance];
	
}

@end
