//
//  ViewController.m
//  PlayerTest
//
//  Created by wangwenke on 16/7/11.
//  Copyright © 2016年 wangwenke. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "XCAVPlayerView.h"

@interface ViewController ()

@property (nonatomic, strong) XCAVPlayerView *playerView;

@end

@implementation ViewController

- (XCAVPlayerView *)playerView{
    if (!_playerView) {
        _playerView = [[XCAVPlayerView alloc]init];
    }
    return _playerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(statuesBarChanged:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    
    UIView *playBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.58)];
    [self.view addSubview:playBgView];
    self.playerView.frame = playBgView.bounds;
    [playBgView addSubview:self.playerView];
    self.playerView.playerUrl = [NSURL URLWithString:@"http://api.feixiong.tv/Api/Base/getShortM3u8?params=%7B%22data%22%3A%7B%22id%22%3A281%2C%22stream_type%22%3A%22hd2%22%2C%22ykss%22%3A%22%22%7D%7D"];
    [self.playerView play];
}



- (void)statuesBarChanged:(NSNotification *)sender{
    UIInterfaceOrientation statues = [UIApplication sharedApplication].statusBarOrientation;
    if (statues == UIInterfaceOrientationPortrait || statues == UIInterfaceOrientationPortraitUpsideDown) {
        self.playerView.frame = CGRectMake(0, 20.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.58);
    }else if (statues == UIInterfaceOrientationLandscapeLeft || statues == UIInterfaceOrientationLandscapeRight){
        self.playerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"%@--%@",object,[change description]);
}

- (void)moviePlayDidEnd:(NSNotification *)noti{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
