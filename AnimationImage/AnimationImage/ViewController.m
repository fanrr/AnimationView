//
//  ViewController.m
//  AnimationImage
//
//  Created by Raymond~ on 2016/10/26.
//  Copyright © 2016年 Raymond~. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AnimationImage.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray * images = [NSMutableArray array];
    for (int i = 0; i < 33; i ++) {
        [images addObject:[NSString stringWithFormat:@"boat%d",i]];
    }
    [self.imageView animationImageNames:images animationDuration:6 repeatCount:3 doneBlock:^{
        NSLog(@"动画结束");
        [self.imageView removeFromSuperview];
    }];
    [self.imageView FR_startAnimating];

//    传统帧动画
//    NSMutableArray * images = [NSMutableArray array];
//    for (int i = 0; i < 33; i ++) {
//        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"boat%d",i]]];
//    }
//    
//    self.imageView.animationImages = images;
//    self.imageView.animationDuration = 6;
//    self.imageView.animationRepeatCount = 0;
//    [self.imageView startAnimating];
//
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.imageView FR_stopAnimating];
    });
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.imageView FR_startAnimating];
//    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
