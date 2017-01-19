//
//  SFSegmentControlDelegate.h
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 18.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SFSegmentControlDelegate <NSObject>

@required

- (void)didSelectSegmentAtIndex:(NSInteger)index;

@end
