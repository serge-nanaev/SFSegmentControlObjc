//
//  SFSegment.h
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 19.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

@interface SFSegment : NSObject

@property (nonatomic) NSString     *title;
@property (nonatomic) NSString     *selectedTitle;

+ (SFSegment*)segmentWithTitle:(NSString*)title andSelectedTitle:(NSString*)selectedTitle;

@end
