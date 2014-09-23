//
//  NTTableViewCell_1.h
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/14.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTAudioRecorder.h"

@interface NTTableViewCell_1 : UITableViewCell
{
	
	NTAudioRecorder *audioRec;
	
	NSTimer *timer_Rocord;
	
}

@property (weak, nonatomic) IBOutlet UISwitch *switch_Rokuon;
@property (weak, nonatomic) IBOutlet UILabel *label_Time;

@end
