//
//  NTEditViewController.h
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/18.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTEditViewController : UIViewController < UITextViewDelegate >

@property (weak, nonatomic) IBOutlet UITextView *textView_Edit;

//- (void)setDetailItem:(NSString *)str;
- (void)setMokuji: (NSString *)str_mokuji serifu: (NSString *)str_serifu;

@end
