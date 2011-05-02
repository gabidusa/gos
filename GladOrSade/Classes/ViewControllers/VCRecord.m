//
//  VCRecord.m
//  GladOrSade
//
//  Created by Emil DUSA on 4/12/11.
//  Copyright 2011 ALU. All rights reserved.
//

#import "VCRecord.h"
#import "Customization.h"
#import "Trace.h"

@interface VCRecord()

// Player related methods
- (void)createPlayer;
- (void)startPlayer;
- (void)stopPlayer;
- (void)playerError;
- (void)onMoviePlayerControllerNotification:(NSNotification *)notification;

// Camera related methods
- (void)showCamera;  
- (void)stopCamera;
- (void)startCamera;

@end

@implementation VCRecord
@synthesize playerSuperView;
@synthesize cameraSuperView;

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
    [_moviePlayerViewController release];
    [playerSuperView release];
    [cameraSuperView release];
    [_okButton release];
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
    self.navigationController.navigationBarHidden = NO;
    
    [self startPlayer];
    [self showCamera];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self stopPlayer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setPlayerSuperView:nil];
    [self setCameraSuperView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Private

- (void)createPlayer
{
    // create the player
	if (!_moviePlayerViewController) {
		_moviePlayerViewController = [[MPMoviePlayerViewController alloc] init];
        _moviePlayerViewController.view.frame = self.playerSuperView.frame; 
		_moviePlayerViewController.moviePlayer.controlStyle = MPMovieControlStyleDefault;
		[_moviePlayerViewController.moviePlayer setFullscreen:YES];
		_moviePlayerViewController.moviePlayer.useApplicationAudioSession = NO;	
        
		_moviePlayerViewController.moviePlayer.view.frame = self.view.bounds;
		
		// add it to the main view
		[playerSuperView addSubview:_moviePlayerViewController.moviePlayer.view];
	}
}

- (void)startPlayer
{
    [self createPlayer];
    
    @try {
		TR_DEBUG(@"Creating Player object for URL: %@", _video.url);
		NSURL *movieURL = [NSURL URLWithString:_video.url];
        NSBundle *bundle = [NSBundle mainBundle];
        if (bundle) {
            NSString *moviePath = [bundle pathForResource:@"movie" ofType:@"mov"];
            if (moviePath)
            {
                movieURL = [NSURL fileURLWithPath:moviePath];
            }
        }
        
		[_moviePlayerViewController.moviePlayer setContentURL:movieURL];
        [_moviePlayerViewController.moviePlayer prepareToPlay];
		//[_moviePlayerViewController.moviePlayer play];
        
		TR_DEBUG(@"Player object created");
	} @catch (NSException *ex) {
		TR_ERROR(@"Exception: %@", [ex description]);
		
        [self playerError];
		
		return;
	}
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onMoviePlayerControllerNotification:) 
												 name:MPMoviePlayerLoadStateDidChangeNotification 
											   object:_moviePlayerViewController.moviePlayer];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onMoviePlayerControllerNotification:) 
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:_moviePlayerViewController.moviePlayer];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onMoviePlayerControllerNotification:) 
												 name:MPMoviePlayerScalingModeDidChangeNotification 
											   object:_moviePlayerViewController.moviePlayer];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onMoviePlayerControllerNotification:) 
												 name:kMPMediaPlaybackIsPreparedToPlayDidChangeNotification 
											   object:_moviePlayerViewController.moviePlayer];
}

- (void)stopPlayer
{
    // We remove ourselves from the notification queue before stoping the Movie Player
	// Controller object so we don't get spurious notifications
	[[NSNotificationCenter defaultCenter] removeObserver:self 
													name:MPMoviePlayerLoadStateDidChangeNotification 
												  object:_moviePlayerViewController.moviePlayer];
	[[NSNotificationCenter defaultCenter] removeObserver:self 
													name:MPMoviePlayerPlaybackDidFinishNotification 
												  object:_moviePlayerViewController.moviePlayer];
	[[NSNotificationCenter defaultCenter] removeObserver:self 
													name:MPMoviePlayerScalingModeDidChangeNotification 
												  object:_moviePlayerViewController.moviePlayer];
	[[NSNotificationCenter defaultCenter] removeObserver:self 
													name:kMPMediaPlaybackIsPreparedToPlayDidChangeNotification
												  object:_moviePlayerViewController.moviePlayer];
	
	[_moviePlayerViewController.moviePlayer stop];
}

- (void)onMoviePlayerControllerNotification:(NSNotification *)notification
{
    TR_DEBUG(@"notification: %@", [notification description]);
    if ([[notification name] isEqualToString:MPMoviePlayerLoadStateDidChangeNotification]) {
		// if we have an error we do not start to play the streqm
		NSString *errorKey = @"error";
		for (id key in [notification userInfo]) {
			if ([key isEqualToString:errorKey] == YES) {
				[self playerError];
				return;
			}
		}
	} 
    else if ([[notification name] isEqualToString:MPMoviePlayerPlaybackDidFinishNotification]) {
		// Do nothing
        [self stopCamera];
	} 
    else if ([[notification name] isEqualToString:MPMoviePlayerScalingModeDidChangeNotification]) {
		// Do nothing
	} 
    else if ([[notification name] isEqualToString:kMPMediaPlaybackIsPreparedToPlayDidChangeNotification]) {
		// Do nothing
        [self startCamera];
	} 
    else {
		TR_INFO(@"not handled notification");
	}
}

- (void)playerError
{
    AlertWithOneBtn([Customization string:STRING_MESSAGE_HEADER_PLAYER_CANNOT_START], 
                    [Customization string:STRING_MESSAGE_PLAYER_CANNOT_START], 
                    [Customization string:STRING_BUTTON_OK], nil);    
}

//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)showCamera
{
    BOOL hasHighResScreen = NO;
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        CGFloat scale = [[UIScreen mainScreen] scale];
        if (scale > 1.0) {
            hasHighResScreen = YES;
        }
    }
    
    if (!hasHighResScreen) {
        AlertWithOneBtn(@"Error", [Customization string:STRING_DEVICE_IS_NOT_IPHONE4], @"Ok", nil);
        //return;
    }
    
    _cameraViewController = [[AVCameraViewController alloc] init];
    _cameraViewController.view.frame = cameraSuperView.bounds;
    [cameraSuperView addSubview:_cameraViewController.view];
    [_cameraViewController initCapture];
}
//-------------------------------------------------------------------
// Stop th camera.
//-------------------------------------------------------------------
- (void)stopCamera
{
    [_cameraViewController stopCapture];
}
//-------------------------------------------------------------------
// Start the camera.
//-------------------------------------------------------------------
- (void)startCamera
{
    [_cameraViewController startCapture];
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (IBAction)onOkButtonTapp:(id)sender 
{
    [_moviePlayerViewController.moviePlayer setContentURL:_cameraViewController.outputUrl];
    [_moviePlayerViewController.moviePlayer play];
}

#pragma mark - Public
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (id)initWithVideo:(Video*)video
{
    if (video != _video) {
        [_video release];
        _video = [video retain];
    }
    
    return self;
}

@end
