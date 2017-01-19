//
//  SFSegmentControl.m
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 18.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import "SFSegmentControl.h"
#import "SFSegmentView.h"
#import "SFSelectorView.h"
#import "SFSegment.h"

IB_DESIGNABLE

@interface SFSegmentControl ()

@property (strong, nonatomic) NSMutableArray    <SFSegmentView*> *segmentsViews;
@property (strong, nonatomic) SFSelectorView    *selectorView;
@property (strong, nonatomic) NSMutableArray    <SFSegment*> *segments;
@property (nonatomic        ) NSUInteger        selectedIndex;
//@property (strong, nonatomic) UIView            *view;

- (void)setup;
- (void)setupContainer;
- (void)generateSegmentViews;
- (void)addInitialData;
- (void)setFrames;
- (void)addGestures;
- (void)initialSetup;
- (void)didTap:(UITapGestureRecognizer*)tapGesture;
- (void)selectNearestSegmentWith:(UIGestureRecognizer*)gesture;
- (NSInteger)getIndexFromPoint:(CGPoint)point;

@end

@implementation SFSegmentControl

#pragma mark Initialization

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark Setters

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    for(SFSegmentView* segmentView in self.segmentsViews) {
        segmentView.textColor = titleColor;
    }
}

- (void)setSelectorTitleColor:(UIColor *)selectorTitleColor {
    _selectorTitleColor = selectorTitleColor;
    [self.selectorView setTextColor:selectorTitleColor];
}

- (void)setSelectorColor:(UIColor *)selectorColor {
    _selectorColor = selectorColor;
    [self.selectorView setBackgroundColor:selectorColor];
}

- (void)setContainerBackgroundColor:(UIColor *)containerBackgroundColor {
    _containerBackgroundColor = containerBackgroundColor;
    [self setBackgroundColor:containerBackgroundColor];
}

- (void)setContainerBorderColor:(UIColor *)containerBorderColor {
    _containerBorderColor = containerBorderColor;
    [self setupContainer];
}

- (void)setContainerBorderWidth:(CGFloat *)containerBorderWidth {
    _containerBorderWidth = containerBorderWidth;
    [self setupContainer];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    for(SFSegmentView* segmentView in self.segmentsViews) {
        segmentView.font = font;
    }
}


#pragma mark Public Methods

- (void)addSegmentWithTitle:(NSString *)title selectedTitle:(NSString *)selectedTitle {
    [self.segments addObject:[SFSegment segmentWithTitle:title andSelectedTitle:selectedTitle]];
    [self generateSegmentViews];
}

- (void)selectSegmentAtIndex:(NSInteger)index {
    self.selectedIndex = index;
    
    CGFloat newPosition = self.bounds.size.width / self.segments.count * index;
    
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = self.selectorView.frame;
        frame.origin.x = newPosition;
        self.selectorView.frame = frame;
        self.selectorView.text = self.segments[index].selectedTitle;
    }];
    
    if ([self.delegate respondsToSelector:@selector(didSelectSegmentAtIndex:)]) {
        [self.delegate didSelectSegmentAtIndex:index];
    }}

- (void)removeSegmentAtIndex:(NSInteger)index {
    [self.segments removeObjectAtIndex:index];
    
    if (index < self.selectedIndex) {
        NSInteger newSelectedindex = self.selectedIndex - 1;
        [self selectSegmentAtIndex:newSelectedindex];
    } else if (index == self.selectedIndex) {
        [self selectSegmentAtIndex:0];
    }
    [self generateSegmentViews];
}

- (void)insertSegmentAtIndex:(NSInteger)index withTitle:(NSString *)title andSelectedTitle:(NSString *)selectedTitle {
    [self.segments insertObject:[SFSegment segmentWithTitle:title andSelectedTitle:selectedTitle] atIndex:index];
    if (index <= self.selectedIndex) {
        NSInteger newSelectedindex = self.selectedIndex + 1;
        [self selectSegmentAtIndex:newSelectedindex];
    }
    [self generateSegmentViews];
}

#pragma mark Utils

//Initial data for Preview
- (void)addInitialData {
    self.segments = [NSMutableArray arrayWithObjects:
                     [SFSegment segmentWithTitle:@"1" andSelectedTitle:@"1 day"],
                     [SFSegment segmentWithTitle:@"2" andSelectedTitle:@"2 days"],
                     [SFSegment segmentWithTitle:@"3" andSelectedTitle:@"3 days"], nil];
    self.selectorView.text = self.segments.firstObject.selectedTitle;
}

#pragma mark Interface setup

- (void)setup {
    [self initialSetup];
    [self addInitialData];
    [self generateSegmentViews];
    [self addGestures];
}

- (void)initialSetup {
    self.selectedIndex = 0;
    self.selectorView = [[SFSelectorView alloc] init];
    self.segmentsViews = [[NSMutableArray alloc] init];
}

- (void)setupContainer {
    self.backgroundColor = self.containerBackgroundColor;
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.layer.borderColor = self.containerBorderColor.CGColor;
    self.layer.borderWidth = 0;
}

- (void)generateSegmentViews {
    [self.selectorView removeFromSuperview];
    for(SFSegmentView* segmentView in self.segmentsViews) {
        [segmentView removeFromSuperview];
    }
    [self.segmentsViews removeAllObjects];
    
    for(SFSegment* segment in self.segments) {
        SFSegmentView* newSegmentView = [[SFSegmentView alloc] init];
        newSegmentView.font = self.font;
        newSegmentView.textColor = self.titleColor;
        newSegmentView.text = segment.title;
        [self addSubview:newSegmentView];
        [self.segmentsViews addObject:newSegmentView];
    }
    [self addSubview:self.selectorView];
}

- (void)setFrames {
    CGFloat width = self.bounds.size.width;
    NSInteger avalibleWidthForSingleSegment = width / self.segmentsViews.count;
    
    NSUInteger index = 0;
    for (SFSegmentView *segment in self.segmentsViews) {
        segment.frame = CGRectMake(index * avalibleWidthForSingleSegment,
                                   0,
                                   avalibleWidthForSingleSegment,
                                   self.bounds.size.height);
        index++;
    }
    
    self.selectorView.frame = CGRectMake(self.selectedIndex * avalibleWidthForSingleSegment,
                                         0,
                                         avalibleWidthForSingleSegment,
                                         self.bounds.size.height);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupContainer];
    [self setFrames];
}

#pragma mark Gestures

- (void)addGestures {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    [self addGestureRecognizer:tap];
    
}

- (void)didTap:(UITapGestureRecognizer *)tapGesture {
    [self selectNearestSegmentWith:tapGesture];
}

//Need for different gestures
-(void)selectNearestSegmentWith:(UIGestureRecognizer *)gesture {
    CGPoint location = [gesture locationInView:self];
    NSInteger newIndex = [self getIndexFromPoint:location];
    
    [self selectSegmentAtIndex:newIndex];
}

-(NSInteger)getIndexFromPoint:(CGPoint)point {
    NSInteger index = point.x / self.selectorView.frame.size.width;
    if (index < 0) { return 0; }
    if (index > self.segments.count) { return self.segments.count - 1; }
    
    return index;
}


@end
