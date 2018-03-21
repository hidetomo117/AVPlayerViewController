//
//  ViewController.m
//  AVPlayerViewController
//
//  Created by masudahidetomo on 2017/10/24.
//  Copyright © 2017年 hidetomo. All rights reserved.
//

#import "ViewController.h"
#import "VideoView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet VideoView *videoView;
@end

static NSString *const urlStr = @"https://s3-ap-northeast-1.amazonaws.com/hls-sample/index.m3u8";

@implementation ViewController

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self removeObserver];
}

#pragma mark - private method

-(void)setup {

    [self.videoView.playerVC.contentOverlayView addObserver:self
                                                 forKeyPath:@"bounds"
                                                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                                                    context:NULL];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.videoView createMoviePlayer:url];
}

#pragma mark - observer

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *, id> *)change
                       context:(void *)context {
    
    if (object == _videoView.playerVC.contentOverlayView) {
        if ([keyPath isEqualToString:@"bounds"]) {
            
            CGRect oldBounds = [change[NSKeyValueChangeOldKey] CGRectValue];
            CGRect newBounds = [change[NSKeyValueChangeNewKey] CGRectValue];
            BOOL wasFullscreen = CGRectEqualToRect(oldBounds, [UIScreen mainScreen].bounds);
            BOOL isFullscreen = CGRectEqualToRect(newBounds, [UIScreen mainScreen].bounds);
            
            if (isFullscreen && !wasFullscreen) {
                NSLog(@"bocome fullscreen");
            } else if (!isFullscreen && wasFullscreen) {
                NSLog(@"exited fullscreen");
            }
        }
    }
}

- (void)removeObserver {
    [_videoView.playerVC.contentOverlayView removeObserver:self forKeyPath:@"bounds"];
}

@end
