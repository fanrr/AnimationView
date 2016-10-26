# AnimationView
iOS UIImageView帧动画优化

# 怎么用它？
```objc
/**
 初始化帧动画

 @param imageNames        帧动画需要的图片名字数组
 @param animationDuration 一次动画需要的时间
 @param repeatCount       重复次数 0为循环
 @param doneBlock         动画完成回调（stop也会触发）
 */
- (void)animationImageNames:(NSArray *)imageNames
          animationDuration:(NSTimeInterval)animationDuration
                repeatCount:(NSInteger)repeatCount
                  doneBlock:(VoidBlock)doneBlock;
```
```objc
/**
 开始动画
 */
- (void)FR_startAnimating;

```
```objc
/**
 结束动画
 */
- (void)FR_stopAnimating;
```