//
//  UIButton+NMCategory.m
//  DragButtonDemo
//
//  Created by Aster0id on 14-5-16.
//
//

#import "UIButton+NMCategory.h"
#import <objc/runtime.h>
#define PADDING     5
static void *DragEnableKey = &DragEnableKey;
static void *AdsorbEnableKey = &AdsorbEnableKey;

@implementation UIButton (NMCategory)


-(void)setDragEnable:(BOOL)dragEnable
{
    objc_setAssociatedObject(self, DragEnableKey,@(dragEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isDragEnable
{
    return [objc_getAssociatedObject(self, DragEnableKey) boolValue];
}

-(void)setAdsorbEnable:(BOOL)adsorbEnable
{
    objc_setAssociatedObject(self, AdsorbEnableKey,@(adsorbEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isAdsorbEnable
{
    return [objc_getAssociatedObject(self, AdsorbEnableKey) boolValue];
}

CGPoint begincenter;
CGPoint beginPoint;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.highlighted = YES;
    if (![objc_getAssociatedObject(self, DragEnableKey) boolValue]) {
        return;
    }
//    begincenter=self.center;
    begincenter=self.superview.center;
    UITouch *touch = [touches anyObject];
    
//    beginPoint = [touch locationInView:self];
    beginPoint = [touch locationInView:self.superview];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
    [super touchesMoved:touches withEvent:event];
    if (![objc_getAssociatedObject(self, DragEnableKey) boolValue]) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    
    CGPoint nowPoint = [touch locationInView:self];
    
    float offsetX = nowPoint.x - beginPoint.x;
    float offsetY = nowPoint.y - beginPoint.y;
    
//    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
    self.superview.center = CGPointMake(self.superview.center.x + offsetX, self.superview.center.y + offsetY);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (self.superview && [objc_getAssociatedObject(self,AdsorbEnableKey) boolValue] ) {
        if (self.highlighted) {
            [self sendActionsForControlEvents:UIControlEventTouchDown];
            self.highlighted = NO;
        }
        
//        CGPoint nowPoint = self.center;
        CGPoint nowPoint = self.superview.center;
        
        
        float offsetX = nowPoint.x - begincenter.x;
        float offsetY = nowPoint.y - begincenter.y;

        
        if (fabsf(offsetX)<5 && fabsf(offsetY)<5) {
            [super touchesEnded:touches withEvent:event];
            
        }
        
//        float marginLeft = self.frame.origin.x;
//        float marginRight = self.superview.frame.size.width - self.frame.origin.x - self.frame.size.width;
//        float marginTop = self.frame.origin.y;
//        float marginBottom = self.superview.frame.size.height - self.frame.origin.y - self.frame.size.height;
        
        float marginLeft = self.superview.frame.origin.x;
        float marginRight = self.superview.superview.frame.size.width - self.superview.frame.origin.x - self.superview.frame.size.width;
        float marginTop = self.superview.frame.origin.y;
        float marginBottom = self.superview.superview.frame.size.height - self.superview.frame.origin.y - self.superview.frame.size.height;
        
        [UIView animateWithDuration:0.125 animations:^(void){
            if (marginTop<60) {
//                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.frame.origin.x:marginRight<PADDING?self.superview.frame.size.width -self.frame.size.width-PADDING:self.frame.origin.x,
//                                        PADDING,
//                                        self.frame.size.width,
//                                        self.frame.size.height);
                self.superview.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.superview.frame.origin.x:marginRight<PADDING?self.superview.superview.frame.size.width -self.superview.frame.size.width-PADDING:self.superview.frame.origin.x,
                                        PADDING,
                                        self.superview.frame.size.width,
                                        self.superview.frame.size.height);
                
                
            }
            else if (marginBottom<60) {
//                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.frame.origin.x:marginRight<PADDING?self.superview.frame.size.width -self.frame.size.width-PADDING:self.frame.origin.x,
//                                        self.superview.frame.size.height - self.frame.size.height-PADDING,
//                                        self.frame.size.width,
//                                        self.frame.size.height);
                
                self.superview.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.superview.frame.origin.x:marginRight<PADDING?self.superview.superview.frame.size.width -self.superview.frame.size.width-PADDING:self.superview.frame.origin.x,
                                        self.superview.superview.frame.size.height - self.superview.frame.size.height-PADDING,
                                        self.superview.frame.size.width,
                                        self.superview.frame.size.height);
                
            }
            else {
//                self.frame = CGRectMake(marginLeft<marginRight?PADDING:self.superview.frame.size.width - self.frame.size.width-PADDING,
//                                        self.frame.origin.y,
//                                        self.frame.size.width,
//                                        self.frame.size.height);
                self.superview.frame = CGRectMake(marginLeft<marginRight?PADDING:self.superview.superview.frame.size.width - self.superview.frame.size.width-PADDING,
                                        self.superview.frame.origin.y,
                                        self.superview.frame.size.width,
                                        self.superview.frame.size.height);
                
            }
        }];
        
    }else{
        [super touchesEnded:touches withEvent:event];
        
    }
}


@end
