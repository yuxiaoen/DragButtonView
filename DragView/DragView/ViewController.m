//
//  ViewController.m
//  DragView
//
//  Created by mac-mini on 16/8/30.
//  Copyright © 2016年 Jett.yu. All rights reserved.
//

#import "ViewController.h"
#import "FlexButtonView.h"


@interface ViewController ()<UIGestureRecognizerDelegate>{
    UIView *dragView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dragView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 80, 80)];
//    dragView.backgroundColor = [UIColor blackColor];
//    [dragView setDragEnable:YES];
//    [dragView setAdsorbEnable: YES];
//    [self.view addSubview:dragView];
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
//    [btn addTarget:self action:@selector(BtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
//    btn.layer.cornerRadius = 40;
//    btn.backgroundColor = [UIColor redColor];
//    [dragView addSubview:btn];
    
    
    
    
    FlexButtonView *fbv = [[FlexButtonView alloc] initWithFrame:CGRectMake(10, 250, 50, 50)];
    fbv.backgroundColor = [UIColor yellowColor];
    
    
    UIButton *baseButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    baseButton.backgroundColor = [UIColor blackColor];
    baseButton.layer.cornerRadius = 25;
    
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button1.backgroundColor = [UIColor redColor];
    button1.alpha = 0;
    button1.layer.cornerRadius = 25;
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button2.backgroundColor = [UIColor blueColor];
    button2.alpha = 0;
    button2.layer.cornerRadius = 25;
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button3.backgroundColor = [UIColor greenColor];
    button3.alpha = 0;
    button3.layer.cornerRadius = 25;
    
    NSArray *array = [[NSArray alloc] initWithObjects:button1,button2,button3, nil];
    [fbv setButtonArray:array];
    
    [fbv setBaseButton:baseButton];
    
    //    [fbv setFrame:CGRectMake(0, 0, 50 + 60 *array.count, 50)];
//    [fbv setFrame:CGRectMake(10, 250, 50, 50)];
    
    fbv.flexBlock = ^(UIButton *btn){
        NSLog(@"%li",btn.tag);
    };
    
    [self.view addSubview:fbv];
    
    
}


-(void)BtnOnclick:(UIButton *)btn{
    NSLog(@"1");
}



@end
