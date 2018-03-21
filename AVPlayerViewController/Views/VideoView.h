//
//  VideoView.h
//  AVPlayerViewController
//
//  Created by masudahidetomo on 2017/10/24.
//  Copyright © 2017年 hidetomo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface VideoView : UIView

@property (nonatomic) AVPlayer *player;
@property (nonatomic) AVPlayerViewController *playerVC;
- (void)createMoviePlayer:(NSURL *)url;

@end
