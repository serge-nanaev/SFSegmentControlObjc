//
//  SFSelectorView.m
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 18.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import "SFSelectorView.h"
#include "SFSegmentConstants.h"

@interface SFSelectorView ()

- (void)initialSetup;
- (void)makeRound;

@end

@implementation SFSelectorView

#pragma mark Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialSetup];
    }
    return self;
}

#pragma mark Setters

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self makeRound];
}

#pragma mark Utils

- (void)initialSetup {
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor defaultSelectorTitleColor];
    self.font = [UIFont defaultFont];
    self.backgroundColor = [UIColor defaultSelectorColor];
}

- (void)makeRound {
    self.layer.masksToBounds = true;
    self.layer.cornerRadius = self.frame.size.height / 2;
}

@end
