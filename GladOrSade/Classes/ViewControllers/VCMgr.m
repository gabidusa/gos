//
//  VCMgr.m
//  GladOrSade
//
//  Created by Emil DUSA on 4/11/11.
//  Copyright 2011 @. All rights reserved.
//

#import "VCMgr.h"

@implementation VCMgr

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationBarHidden = YES;
        [Customization loadCustomizations];
        [Configuration loadConfigs];
    }
    return self;
}

- (void)dealloc
{    
    [vcLogin release];
    [vcVideos release];
    [vcRecord release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showScreen:ScreenLogin withParam:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Public

- (void)showScreen:(ScreenType)screen
         withParam:(id)param
{
    UIViewController *vc = nil;
    switch (screen) {
        case ScreenLogin:
            {
                if (!vcLogin) {
                    vcLogin = [[VCLogin alloc] init];
                }
                vc = (UIViewController*)vcLogin;
            }
            break;
        case ScreenVideos:
            {
                if (!vcVideos) {
                    vcVideos = [[VCVideos alloc] init];
                }
                vc = (UIViewController*)vcVideos;
            }
            break;
        case ScreenRecord:
            {
                if (!vcRecord) {
                    vcRecord = [[VCRecord alloc] initWithVideo:(Video*)param];
                }
                vc = (UIViewController*)vcRecord;
            }
            break;
        default:
            break;
    }
    
    if (vc) {
        [self pushViewController:vc animated:YES];
    }
}

@end
