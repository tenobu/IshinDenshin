//
//  NTAppDelegate.h
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/12.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTAppDelegate : UIResponder <UIApplicationDelegate>
{

	//NSArray        *array_Mokuji;
	//NSMutableArray *array_Mokuji;
	//NSMutableDictionary *dir_Mokuji;
	//NSMutableArray *array_Original;
	//NSMutableDictionary *dir_Original;
		
}

@property (strong, nonatomic) UIWindow *window;

@property BOOL bool_Rokuon;
@property NSMutableArray *array_Mokuji;
@property NSMutableArray *array_Original;

@property NSString       *string_Mokuji;

@property NSMutableArray *array_Serifu;
@property NSString       *string_Serifu;

- (void)setReadMokuji;
- (void)setReadSerifu: (NSString *)str_mokuji;
- (void)setNewSerifu: (NSString *)str_new;

@end
