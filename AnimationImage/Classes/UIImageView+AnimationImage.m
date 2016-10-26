//
//  UIImageView+AnimationImage.m
//  PresentTest
//
//  Created by Raymond~ on 2016/10/9.
//  Copyright © 2016年 Raymond~. All rights reserved.
//

#import "UIImageView+AnimationImage.h"
#import <sys/sysctl.h>
#import <objc/runtime.h>
#import <ImageIO/ImageIO.h>
static VoidBlock  animaitonDoneBlock;
static int currentIndex = 0;
static NSTimer * FR_timer;
static NSInteger FR_repeatCount;
@implementation UIImageView (AnimationImage)
- (void)FR_stopAnimating{
    [FR_timer invalidate];
    FR_timer = nil;
    self.image = nil;
    if (animaitonDoneBlock) {
        animaitonDoneBlock();
    }
}
- (void)FR_startAnimating{
    [FR_timer fire];
}
- (void)animationImageNames:(NSArray *)imageNames
          animationDuration:(NSTimeInterval)animationDuration
                repeatCount:(NSInteger)repeatCount
                  doneBlock:(VoidBlock)doneBlock{
    currentIndex = 0;
    animaitonDoneBlock = doneBlock;
    FR_repeatCount = repeatCount;
    FR_timer = [NSTimer timerWithTimeInterval:animationDuration / imageNames.count target:self selector:@selector(changeImage:) userInfo:imageNames repeats:YES];
    NSRunLoop *runloop=[NSRunLoop currentRunLoop];
    [runloop addTimer:FR_timer forMode:NSDefaultRunLoopMode];
    
}
- (void)changeImage:(NSTimer *)timer{
    
    NSArray * imageNames = timer.userInfo;;
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:[imageNames objectAtIndex:currentIndex] ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    self.image = image;
    currentIndex ++;
    
    if (currentIndex >= imageNames.count - 1) {
        if (FR_repeatCount == 0) {
            currentIndex = 0;
        }else if(FR_repeatCount != 1){
            currentIndex = 0;
            FR_repeatCount --;
        }else{
            [timer invalidate];
            currentIndex = (int)imageNames.count - 1;
            self.image = nil;
            if (animaitonDoneBlock) {
                animaitonDoneBlock();
            }
        }
    }
}
- (void)dealloc{
    NSLog(@"AnimationImage dealloc %@",self);
}
@end
