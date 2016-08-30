//
//  FlexButtonView.m
//  HelloWorld1
//
//  Created by mac-mini on 16/8/29.
//  Copyright © 2016年 mac-mini. All rights reserved.
//

#import "FlexButtonView.h"
#import <objc/runtime.h>
#import "UIButton+NMCategory.h"


#define PADDING     5
static void *DragEnableKey = &DragEnableKey;
static void *AdsorbEnableKey = &AdsorbEnableKey;


@interface FlexButtonView(){
    UIButton *baseButton;
    
    NSArray *buttonArray;
    
}

@property (nonatomic, assign) float btndistance;

@end

@implementation FlexButtonView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _btndistance = 60;
//        [self setDragEnable:YES];
//        [self setAdsorbEnable:YES];
        
    }
    return self;
}


-(void)setButtonArray:(NSArray *)btnArray{
    buttonArray = btnArray;
    int btntag = 100;
    for (UIButton *btn in buttonArray) {
        btn.alpha = 0;
        btn.tag = btntag;
        btntag ++;
        [btn addTarget:self action:@selector(btnOnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
}

-(void)setBaseButton:(UIButton *)btn{
    baseButton = btn;
    [baseButton setDragEnable:YES];
    [baseButton setAdsorbEnable:YES];
    [baseButton addTarget:self action:@selector(ShowHiddenOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:baseButton];
    
}

-(void)ShowHiddenOnclick:(UIButton *)btn{
    if (btn.selected == YES) {
        btn.selected = NO;
        [self btnHidden];
    }else{
        btn.selected = YES;
        [self btnShow];
        
    }
}

-(void)btnHidden{
    [UIView animateWithDuration:0.25 animations:^{
        for (UIButton *btn in buttonArray) {
            [btn setCenter:CGPointMake(btn.center.x - _btndistance * (btn.tag - 99), btn.center.y) ];
            btn.alpha = 0;
            
        }
    } completion:^(BOOL finished) {
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, baseButton.frame.size.width, baseButton.frame.size.height)];
    }];
}

-(void)btnShow{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, baseButton.frame.size.width + 60 * buttonArray.count, baseButton.frame.size.height)];
    [UIView animateWithDuration:0.25 animations:^{
        for (UIButton *btn in buttonArray) {
            [btn setCenter:CGPointMake(_btndistance * (btn.tag - 99) + btn.center.x, btn.center.y) ];
            btn.alpha = 1;
        }
    }];
}

-(void)btnOnclick:(UIButton *)btn{
    self.flexBlock(btn);
}


-(UIButton *)getBaseButton{
    return baseButton;
}



@end
