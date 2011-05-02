//
//  VCChooseFrame.h
//  GladOrSade
//
//  Created by Emil DUSA on 4/28/11.
//  Copyright 2011 ALU. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VCChooseFrame : UIViewController {
    
    UIImageView *imageView;
    UISlider *movieSlider;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UISlider *movieSlider;

- (void)initWithVideoURL:(NSString*)videoUrl;

@end
