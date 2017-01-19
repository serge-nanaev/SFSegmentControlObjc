//
//  SFSegmentConstants.h
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 19.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Fonts
extern UIFont const *defaultFont;

@interface UIFont (UIFont_Constants)

+(UIFont *) defaultFont;

@end

#pragma mark - Colors
@interface UIColor (UIColor_Constants)

+(UIColor *) defaultTitleColor;
+(UIColor *) defaultSelectorTitleColor;
+(UIColor *) defaultSelectorColor;
+(UIColor *) defaultContainerBackgroundColor;
+(UIColor *) defaultContainerBorderColor;
+(UIColor *) defaultContainerBorderWidth;

@end



