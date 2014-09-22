//
//  NTAudioPlayer.h
//  IshinDenshin
//
//  Created by ビザンコムマック０９ on 2014/09/22.
//  Created by 吉岡誠史 on 2014/09/19.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface NTAudioPlayer : NSObject

@property(nonatomic) AVAudioPlayer *player;

- (void)play;
- (void)pause;

@end

