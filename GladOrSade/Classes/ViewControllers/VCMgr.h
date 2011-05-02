//
//  VCMgr.h
//  GladOrSade
//
//  Created by Emil DUSA on 4/11/11.
//  Copyright 2011 @. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customization.h"
#import "Configuration.h"
#import "AlertMessages.h"

@class VCLogin;
@class VCVideos;
@class VCRecord;
@class Video;

typedef enum {
    ScreenLogin,
    ScreenVideos,
    ScreenRecord,
}ScreenType;

@interface VCMgr : UINavigationController {
    VCLogin     *vcLogin;
    VCVideos    *vcVideos;
    VCRecord    *vcRecord;
}

- (void)showScreen:(ScreenType)screen 
         withParam:(id)param;

@end
