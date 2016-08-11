//
//  QScalableNav.h
//  ScalableNav
//
//  Created by Mr.Q on 16/7/1.
//  Copyright © 2016年 MrQ. All rights reserved.
//

#define kSize [UIScreen mainScreen].bounds.size

#import <UIKit/UIKit.h>

static const CGFloat MaxHeight = 200;
static const CGFloat navHeight = 0;

@interface QScalableNav : UIView

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, copy) void(^imgActionBlock)();

- (id)initWithFrame:(CGRect)frame backgroundImage:(NSString *)backgroudImage headerImage:(NSString *)headerImage title:(NSString *)title subTitle:(NSString *)subTitle;

- (void)updateSubViewsWithScrollOffset:(CGPoint)newOffset;

- (void)setTitleColor:(UIColor *)titleColor subTitleColor:(UIColor *)subTitleColor;
@end
