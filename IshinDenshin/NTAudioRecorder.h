//
//  NTAudioRecorder.h
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/15.
//  Created by 吉岡誠史 on 2014/09/19.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface NTAudioRecorder : NSObject < AVAudioRecorderDelegate, AVAudioPlayerDelegate >
{

@private

    AVAudioRecorder *avRecorder;
    AVAudioPlayer *avPlayer;

}

//- (id)init;
- (void)record: (NSString *)str_date;
- (NSTimeInterval)time;
- (void)stop;
- (void)play: (NSString *)str_date;

//@property (nonatomic) AVAudioSession *session;
@property (nonatomic) AVAudioPlayer  *player;

@property NSString *string_Filename;

@end
