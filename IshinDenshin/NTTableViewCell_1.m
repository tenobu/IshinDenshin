//
//  NTTableViewCell_1.m
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/14.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTTableViewCell_1.h"

#import "NTAppDelegate.h"
#import "NTAudioRecorder.h"

@implementation NTTableViewCell_1
{

@private

	NSString *string_File;
	
}

- (id)initWithStyle: (UITableViewCellStyle)style
	reuseIdentifier: (NSString *)reuseIdentifier
{
    
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
	if (self) {
        // Initialization code
    }
    
	return self;

}

- (void)awakeFromNib
{

    // Initialization code

}

- (void)setSelected: (BOOL)selected
		   animated: (BOOL)animated
{

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state

}

- (IBAction)switch_Action: (id)sender
{
	
	UISwitch *switch_rokuon = (UISwitch *)sender;
	
	if ( switch_rokuon.on == YES ) {
		
		audioRec = [[NTAudioRecorder alloc] init];
		
		NSDate *now_date = [NSDate new];

		NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
		
		dateForm.dateFormat = @"yyyyMMdd HHmmss";
		
		NSString *str_date = [dateForm stringFromDate: now_date];

		[audioRec record: str_date];
		
		timer_Rocord = [NSTimer scheduledTimerWithTimeInterval: 1.0f
														target: self
													  selector: @selector(rokuon_Timer:)
													  userInfo: nil
													   repeats: YES];
		
		string_File = audioRec.string_Filename;
		
	} else {
		
		[audioRec stop];
		
		[audioRec play: string_File];
		

		/*NSString *str_file = audioRec.string_Filename;
		NSString *str_date = [str_file substringFromIndex: [str_file length] - 4];
		
		NSTimeInterval time = [audioRec time];
		NSNumber *number = [NSNumber numberWithInteger: time];
		
		NSDictionary *dir = [NSDictionary dictionaryWithObjectsAndKeys:
							 str_date, @"date_time",
							 number  , @"rokuon_time", nil];
		
		NTAppDelegate *app = [[UIApplication sharedApplication] delegate];

		[app.array_Rokuon addObject: dir];*/
		
	}	
	
}

- (void)rokuon_Timer: (NSTimer*)timer
{
	
	NSTimeInterval time = [audioRec time];
	
	NSInteger hh = time / ( 60 * 60 );
	
	time -= hh * 60 * 60;
	
	NSInteger mm = time / 60;
	
	time -= mm * 60 * 60;
	
	NSInteger ss = time;
	
	NSString *str_time = [NSString stringWithFormat: @"%02d:%02d:%02d", hh, mm, ss];
	
	self.label_Time.text = str_time;
	
}

@end
