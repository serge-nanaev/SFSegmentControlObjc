//
//  SFSegmentView.m
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 18.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import "SFSegmentView.h"
#import "SFSegmentConstants.h"


@interface SFSegmentView ()

- (void)initialSetup;

@end

@implementation SFSegmentView

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

#pragma mark Utils

- (void)initialSetup {
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor defaultTitleColor];
    self.font = [UIFont defaultFont];
    self.backgroundColor = [UIColor clearColor];
}

@end
