//
//  FlexButtonView.h
//  HelloWorld1
//
//  Created by mac-mini on 16/8/29.
//  Copyright © 2016年 mac-mini. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^FlexButtonViewBlock)(UIButton *btn);

@interface FlexButtonView : UIView

@property (nonatomic, copy) FlexButtonViewBlock flexBlock;

-(void)setButtonArray:(NSArray *)btnArray;

-(void)setBaseButton:(UIButton *)btn;

-(UIButton *)getBaseButton;

@property(nonatomic,assign,getter = isDragEnable)   BOOL dragEnable;
@property(nonatomic,assign,getter = isAdsorbEnable) BOOL adsorbEnable;
@end
