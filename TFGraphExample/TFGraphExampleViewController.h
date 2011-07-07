//
//  TFGraphExampleViewController.h
//  TFGraphExample
//
//  Created by Timothy Fazio on 8/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFLineGraph.h"

@interface TFGraphExampleViewController : UIViewController {
    TFLineGraph *graphView;
}

@property (nonatomic, retain) IBOutlet TFLineGraph *graphView;

@end
