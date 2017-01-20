//
//  SFSegmentControl.h
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 18.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFSegmentControlDelegate.h"

IB_DESIGNABLE

@interface SFSegmentControl : UIView

@property (nonatomic) IBInspectable UIColor     *titleColor;
@property (nonatomic) IBInspectable UIColor     *selectorTitleColor;
@property (nonatomic) IBInspectable UIColor     *selectorColor;
@property (nonatomic) IBInspectable UIColor     *containerBackgroundColor;
@property (nonatomic) IBInspectable UIColor     *containerBorderColor;

@property (nonatomic) IBInspectable CGFloat     containerBorderWidth;
@property (nonatomic)               UIFont      *font;

@property (nonatomic, weak) IBOutlet id <SFSegmentControlDelegate> delegate;

- (void)addSegmentWithTitle:(NSString*)title selectedTitle:(NSString*)selectedTitle;
- (void)insertSegmentAtIndex:(NSInteger)index withTitle:(NSString*)title andSelectedTitle:(NSString*)selectedTitle;
- (void)removeSegmentAtIndex:(NSInteger)index;
- (void)selectSegmentAtIndex:(NSInteger)index;

@end

