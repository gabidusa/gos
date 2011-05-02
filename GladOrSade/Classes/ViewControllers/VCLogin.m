//
//  VCLogin.m
//  GladOrSade
//
//  Created by Emil DUSA on 4/12/11.
//  Copyright 2011 ALU. All rights reserved.
//

#import "VCLogin.h"
#import "UICustomLabel.h"

@interface VCLogin()

- (void)doLogin;
- (void)onRegisterTapp;

@end

@implementation VCLogin
@synthesize logoBanner;
@synthesize username;
@synthesize password;
@synthesize login;
@synthesize link;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [logoBanner release];
    [username release];
    [password release];
    [login release];
    [link release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // logoBanner
    self.logoBanner.image = [Customization image:IMAGE_LOGO_BANNER];
    // username
    self.username.text = [Customization string:STRING_PLACEHOLDER_USERNAME];
    // password
    self.password.text = [Customization string:STRING_PLACEHOLDER_PASSWORD];
    // login
    [self.login setTitle:[Customization string:STRING_BUTTON_LOGIN] forState:UIControlStateNormal];
    [self.login setTitle:[Customization string:STRING_BUTTON_LOGIN] forState:UIControlStateSelected];
    [self.login addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    // link
    CGRect frame = self.link.frame;
    [self.link removeFromSuperview];
    self.link = [[UICustomLabel alloc] initWithFrame:frame];
    [self.link setTarget:self 
           forTappAction:@selector(onRegisterTapp)];
    self.link.text = [Customization string:STRING_TEXT_REGISTER_FOR_ACCOUNT];
    self.link.font = [Customization font:FONT_SYSTEM_BOLD_13];
    self.link.userInteractionEnabled = YES;
    self.link.backgroundColor = [Customization color:COLOR_CLEAR];
    self.link.textColor = [Customization color:COLOR_LINK_NORMAL];
    self.link.highlightedTextColor = [Customization color:COLOR_LINK_HIGHLIGHTED];
    [self.view addSubview:self.link];
}

- (void)viewDidUnload
{
    [self setLink:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Private methods
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
-(void)doLogin
{
    BOOL loginOk = ([username.text compare:@"user"] == NSOrderedSame) && ([password.text compare:@"pass"] == NSOrderedSame) ? YES : NO;
    if (loginOk) {
        mgr = (VCMgr*)self.navigationController;
        [mgr showScreen:ScreenVideos withParam:nil];
    }
    else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[Customization string:STRING_LOGIN_ERROR_TITLE] 
                                                        message:[Customization string:STRING_LOGIN_ERROR_MESSAGE]  
                                                       delegate:self 
                                              cancelButtonTitle:[Customization string:STRING_LOGIN_ERROR_BUTTON_TITLE]  otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)onRegisterTapp
{
    NSURL *url = [NSURL URLWithString:GLAD_OR_SAD_URL];
    [[UIApplication sharedApplication] openURL:url];
}

@end
