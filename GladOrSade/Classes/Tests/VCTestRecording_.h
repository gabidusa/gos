//
//  VCTestRecording.h
//  GladOrSade
//
//  Created by Emil DUSA on 4/5/11.
//  Copyright 2011 @. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#define kUTTypeImage @"public.image"
#define kUTTypeMovie @"public.video"

@interface VCTestRecording : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIImagePickerController     *picker;
    MPMoviePlayerViewController *player;
}

@end
