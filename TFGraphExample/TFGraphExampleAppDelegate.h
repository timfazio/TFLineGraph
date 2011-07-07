//
//  TFGraphExampleAppDelegate.h
//  TFGraphExample
//
//  Created by Timothy Fazio on 8/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TFGraphExampleViewController;

@interface TFGraphExampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TFGraphExampleViewController *viewController;

@end
