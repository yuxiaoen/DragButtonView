//
//  UIView+NMCategory.h
//  HelloWorld1
//
//  Created by mac-mini on 16/8/30.
//  Copyright © 2016年 mac-mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(NMCategory)
@property(nonatomic,assign,getter = isDragEnable)   BOOL dragEnable;
@property(nonatomic,assign,getter = isAdsorbEnable) BOOL adsorbEnable;
@end
