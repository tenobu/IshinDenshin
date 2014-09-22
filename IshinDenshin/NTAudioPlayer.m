//
//  NTAudioPlayer.m
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/22.
//  Created by 吉岡誠史 on 2014/09/19.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTAudioPlayer.h"

@implementation NTAudioPlayer

- (void)play
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

}

- (void)pause
{
    
	if ( self.player.playing ) {
    
		[self.player pause];

    }

}

/*-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if ( flag )
    {
        NSLog(@"Done");
        [self.playButton setTitle:@"Start" forState:UIControlStateNormal];
        
        // Can start next audio?
    }
}*/

@end
