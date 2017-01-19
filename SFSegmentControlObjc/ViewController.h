//
//  ViewController.h
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 18.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFSegmentControl.h"
#import "SFSegmentControlDelegate.h"


@interface ViewController : UIViewController <SFSegmentControlDelegate>
@property (weak, nonatomic) IBOutlet SFSegmentControl *sfSegmentControl;


@end

