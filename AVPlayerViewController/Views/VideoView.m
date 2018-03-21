//
//  VideoView.m
//  AVPlayerViewController
//
//  Created by masudahidetomo on 2017/10/24.
//  Copyright © 2017年 hidetomo. All rights reserved.
//

#import "VideoView.h"

@implementation VideoView

#pragma mark - initialize

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)dealloc {
    if (self.player) {
        [self.player pause];
        [self.playerVC.view removeFromSuperview];
        self.playerVC = nil;
    }
}

#pragma mark - play movie

- (void)createMoviePlayer:(NSURL *)url {
    
    self.player = [[AVPlayer alloc]initWithURL:url];
    self.playerVC = [AVPlayerViewController new];
    
    self.playerVC.player = self.player;
    [self.player play];
    
    self.playerVC.view.backgroundColor = [UIColor whiteColor];
    self.playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
    self.playerVC.view.frame = self.bounds;
    self.playerVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.autoresizesSubviews = YES;
    
    [self addSubview:_playerVC.view];
}

@end
