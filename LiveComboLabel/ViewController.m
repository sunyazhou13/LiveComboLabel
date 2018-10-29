//
//  ViewController.m
//  LiveComboLabel
//
//  Created by sunyazhou on 2018/10/29.
//  Copyright © 2018 sunyazhou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *comboLabel;
@property (nonatomic, assign) NSUInteger danceCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.danceCount = 0;
    
    //这种字体比较粗大 看起来比较好看
    self.comboLabel.font = [UIFont fontWithName:@"AvenirNext-BoldItalic" size:50];
}

// 数字跳动
- (void)labelDanceAnimation:(NSTimeInterval)duration {
    //透明度
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 0.4 * duration;
    opacityAnimation.fromValue = @0.f;
    opacityAnimation.toValue = @1.f;
    
    //缩放
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.values = @[@3.f, @1.f, @1.2f, @1.f];
    scaleAnimation.keyTimes = @[@0.f, @0.16f, @0.28f, @0.4f];
    scaleAnimation.removedOnCompletion = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[opacityAnimation, scaleAnimation];
    animationGroup.duration = duration;
    animationGroup.removedOnCompletion = YES;
    animationGroup.fillMode = kCAFillModeForwards;
    
    [self.comboLabel.layer addAnimation:animationGroup forKey:@"kComboAnimationKey"];
}

- (IBAction)clickAction:(UIButton *)sender {
    self.danceCount++;
    [self labelDanceAnimation:0.4];
    self.comboLabel.text = [NSString stringWithFormat:@"+  %tu",self.danceCount];
    if (self.danceCount % 10 == 0) {
        [self dozenCountAnimation];
    }
}

- (void)dozenCountAnimation {
    //特效
    NSLog(@"缝十特效");
    // ... 添加特效代码 这里就不写了
}

@end
