//
//  SFSegmentConstants.m
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 19.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFSegmentConstants.h"

#pragma mark - Colors

@implementation UIFont (UIFont_Constants)

+(UIFont *) defaultFont {
    return [UIFont systemFontOfSize:14];
}

@end

@implementation UIColor (UIColor_Constants)

+(UIColor *) defaultTitleColor {
    return [UIColor darkGrayColor];
}

+(UIColor *) defaultSelectorTitleColor {
    return [UIColor whiteColor];
}

+(UIColor *) defaultSelectorColor {
    return [UIColor colorWithRed:0.26f green:0.69f blue:1.0f alpha:1.0f];
}

+(UIColor *) defaultContainerBackgroundColor {
    return [UIColor colorWithRed:0.1f green:0.004f blue:0.3f alpha:0.3f];
}

+(UIColor *) defaultContainerBorderColor {
    return [UIColor colorWithRed:0.1f green:0.004f blue:0.3f alpha:0.3f];
}

+(UIColor *) defaultContainerBorderWidth {
    return [UIColor colorWithRed:0.1f green:0.004f blue:0.3f alpha:0.3f];
}

@end
