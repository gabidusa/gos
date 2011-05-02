//
//  VCRecord.h
//  GladOrSade
//
//  Created by Emil DUSA on 4/12/11.
//  Copyright 2011 ALU. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import <UIKit/UIKit.h>
#import "Video.h"
#import "VCMgr.h"
#import "AVCameraViewController.h"

#define kMPMediaPlaybackIsPreparedToPlayDidChangeNotification @"MPMediaPlaybackIsPreparedToPlayDidChangeNotification"
#define kUTTypeImage @"public.image"
#define kUTTypeMovie @"public.video"

@interface VCRecord : UIViewController <UINavigationControllerDelegate>{
    Video                       *_video;

    MPMoviePlayerViewController	*_moviePlayerViewController;
    AVCameraViewController      *_cameraViewController;
    
    UIView                      *playerSuperView;
    UIView                      *cameraSuperView;
    UIButton *_okButton;
    
    VCMgr                       *mgr;
}
@property (nonatomic, retain) IBOutlet UIView   *playerSuperView;
@property (nonatomic, retain) IBOutlet UIView   *cameraSuperView;

- (id)initWithVideo:(Video*)video;

@end
