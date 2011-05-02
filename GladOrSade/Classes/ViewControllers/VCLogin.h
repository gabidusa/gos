//
//  VCLogin.h
//  GladOrSade
//
//  Created by Emil DUSA on 4/12/11.
//  Copyright 2011 ALU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCMgr.h"
#import "UICustomLabel.h"

#define GLAD_OR_SAD_URL @"http://www.gladorsad.com/"

@interface VCLogin : UIViewController {
@private    
    UIImageView     *logoBanner;
    UITextField     *username;
    UITextField     *password;
    UIButton        *login;
    UICustomLabel   *link;
    
    VCMgr           *mgr;
}
@property (nonatomic, retain) IBOutlet UIImageView      *logoBanner;
@property (nonatomic, retain) IBOutlet UITextField      *username;
@property (nonatomic, retain) IBOutlet UITextField      *password;
@property (nonatomic, retain) IBOutlet UIButton         *login;
@property (nonatomic, retain) IBOutlet UICustomLabel    *link;

@end
