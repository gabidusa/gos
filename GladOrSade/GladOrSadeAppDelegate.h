//
//  GladOrSadeAppDelegate.h
//  GladOrSade
//
//  Created by Emil DUSA on 4/5/11.
//  Copyright 2011 @. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCMgr.h"

@interface GladOrSadeAppDelegate : NSObject <UIApplicationDelegate> {
    VCMgr *vcMgr;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
