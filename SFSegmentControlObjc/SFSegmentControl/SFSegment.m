//
//  SFSegment.m
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 19.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SFSegment.h"

@implementation SFSegment

+ (SFSegment*)segmentWithTitle:(NSString*)title andSelectedTitle:(NSString*)selectedTitle {
    SFSegment *segment = [[SFSegment alloc] init];
    segment.title = title;
    segment.selectedTitle = selectedTitle;
    
    return segment;
}

@end
