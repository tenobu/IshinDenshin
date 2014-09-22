//
//  NTAudioRecorder.m
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/15.
//  Created by 吉岡誠史 on 2014/09/19.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTAudioRecorder.h"

@implementation NTAudioRecorder

/*- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    NSDate* date = [NSDate date];
    [defaults setObject:date forKey:@"DATE"];
    
}*/



- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
	//    [player release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)record
{

    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
	NSError *error = nil;
	
	self.session = [AVAudioSession sharedInstance];
    
	// 使用している機種が録音に対応しているか
    if ( self.session.inputAvailable ) {
    
		[self.session setCategory: AVAudioSessionCategoryPlayAndRecord
							error: &error];
    
	}
    
	if ( error ) {
		
        NSLog(@"audioSession: %@ %d %@", [error domain], [error code], [[error userInfo] description]);
    
	}
    
	// 録音機能をアクティブにする
    [audioSession setActive:YES error:&error];
    
	if ( error ) {
    
		NSLog(@"audioSession: %@ %d %@", [error domain], [error code], [[error userInfo] description]);
    
	}
    
    // 録音ファイルパス
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    
	NSString *documentDir = [filePaths objectAtIndex: 0];
    
	NSString *path = [documentDir stringByAppendingPathComponent: @"rec.caf"];
    
	NSURL *recordingURL = [NSURL fileURLWithPath: path];
    
    /*
	 
	 NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
	 [NSNumber numberWithFloat: 44100.0], AVSampleRateKey,
	 [NSNumber numberWithInt: kAudioFormatLinearPCM], AVFormatIDKey,
	 [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
	 [NSNumber numberWithInt:16], AVLinearPCMBitDepthKey,
	 [NSNumber numberWithBool:NO], AVLinearPCMIsBigEndianKey,
	 [NSNumber numberWithBool:NO], AVLinearPCMIsFloatKey,
	 nil];
	 
	 AvRecorder = [[AVAudioRecorder alloc] initWithURL:recordingURL settings:settings error:&error];
	 */
    
    // 録音中に音量をとる場合はYES
	//    AvRecorder.meteringEnabled = YES;
    
    avRecorder = [[AVAudioRecorder alloc] initWithURL: recordingURL
											 settings: nil
												error: &error];
    
    if ( error ) {
        
		NSLog(@"error = %@",error);
        
		return;
    
	}
    
	avRecorder.delegate = self;
	
	//    ５秒録音して終了
	//    [avRecorder recordForDuration: 5.0];
    
    [avRecorder record];

}

// 録音が終わったら呼ばれるメソッド

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
	/*
	 NSURL *recordingURL = recorder.url;
	 player = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
	 player.delegate = self;
	 //    player.volume=1.0;
	 [player play];
	 */
}

- (void)stop
{
	
    [avRecorder stop];
    
}

- (void)play
{
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
	[audioSession setCategory: AVAudioSessionCategoryAmbient error: nil];
    
    // 録音ファイルパス
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
	
    NSString *documentDir = [filePaths objectAtIndex: 0];
    
	NSString *path = [documentDir stringByAppendingPathComponent: @"rec.caf"];
    
	NSURL *recordingURL = [NSURL fileURLWithPath: path];
    
    avPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL: recordingURL
													 error: nil];
    avPlayer.delegate = self;
    avPlayer.volume=1.0;
    
	[avPlayer play];
    
}

- (void)pause
{
    
	if ( avPlayer.playing ) {
		
		[avPlayer pause];
		
    }
	
}


/*- (void)play
{
    
	NSError *error = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ng" ofType:@"wav"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if ( error != nil )
    {
        NSLog(@"Error %@", [error localizedDescription]);
    }
    
    [self.player prepareToPlay];
    [self.player setDelegate: self];
    
	NSTimeInterval ti = self.player.duration;
	
	int minutes = floor(ti / 60);
	int second = round(ti - minutes * 60);
	NSLog(@"%02d:%02d", minutes, second); // これで 03:00 みたいな表記もできる
	
	[self.player play];
	
}*/

@end
