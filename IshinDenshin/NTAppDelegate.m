//
//  NTAppDelegate.m
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/12.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTAppDelegate.h"

@implementation NTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	
    // Override point for customization after application launch.

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];

	NSString *init_ver = [ud stringForKey: @"init_version"];
	if ( [init_ver isEqualToString: @"init_end"] == NO ) {
		
		[self setInit];
		
		[ud setObject: @"init_end" forKey: @"init_version"];
		
	}
	
	return YES;

}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setInit
{
	
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
	
	NSBundle* bundle = [NSBundle mainBundle];
	
	// 読み込むファイルパスを指定
	NSString *path = [bundle pathForResource: @"TitleSerifu"
									  ofType: @"plist"];
	
	// plistの読み込み
	NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile: path];
	
	NSMutableArray *array_mokuji = [[NSMutableArray alloc] init];
	
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
		[array_mokuji addObject: dir_data];

	}
	
	[ud setObject: array_mokuji forKey: @"array_Mokuji"];
		
		
	NSMutableArray *array_original = [[NSMutableArray alloc] init];
		
	//読み込むファイルパスを指定
	path = [bundle pathForResource: @"OriginalSerifu"
							ofType: @"plist"];
	
	dic = [NSDictionary dictionaryWithContentsOfFile: path];
		
	for ( NSString *key in [dic allKeys] ) {
			
		[array_original addObject: key];
		
		// Titleを足す
		//[dir_data setObject: key forKey: @"title"];
		
		// dir_dataを足す
		//[array_mokuji addObject: dir_data];
			
	}
				
	//[array_Original addObject: @"11111"];
		
	[ud setObject: array_original forKey: @"array_Originalr"];

}

@end
