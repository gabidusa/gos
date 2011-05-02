//
//  VCTestRecording.m
//  GladOrSade
//
//  Created by Emil DUSA on 4/5/11.
//  Copyright 2011 @. All rights reserved.
//

#import "VCTestRecording.h"

static NSString* kMPMediaPlaybackIsPreparedToPlayDidChangeNotification = @"MPMediaPlaybackIsPreparedToPlayDidChangeNotification";

@interface VCTestRecording()

- (void)showPicker:(UIImagePickerControllerSourceType)pickerType;
- (void)removePicker;    
- (void)stopCamera;
- (void)startCamera;

@end

@implementation VCTestRecording

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
    [picker release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self showPicker:UIImagePickerControllerSourceTypeCamera];
    //[self showPicker:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)didAppear
{
    [super viewDidAppear:didAppear];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark  - Private
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)startCamera
{
    [picker startVideoCapture];
    [NSTimer scheduledTimerWithTimeInterval:4 
                                     target:self 
                                   selector:@selector(stopCamera) 
                                   userInfo:nil 
                                    repeats:NO];
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)stopCamera
{
    [picker stopVideoCapture];
   
    /*
    sleep(5);
    
    for (UIView *view in [[picker topViewController].view subviews]) {
        NSLog(@"class:%@", [view class]);
        for (UIView *subView in [view subviews]) {
            NSLog(@"    class:%@", [subView class]);
            for (UIView *subView1 in [view subviews]) {
                NSLog(@"        class:%@", [subView1 class]);
                for (UIView *subView2 in [view subviews]) {
                    NSLog(@"        class:%@", [subView2 class]);
                }
            }
        }
    }
    //[b sendActionsForControlEvents:UIControlEventTouchUpInside];
    */ 
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)showPicker:(UIImagePickerControllerSourceType)pickerType
{
    picker = [[UIImagePickerController alloc] init];
    picker.sourceType = pickerType;
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerType];
    picker.mediaTypes = mediaTypes;
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
    picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    picker.showsCameraControls = NO;
    
    // present the picker
    [self presentModalViewController:picker animated:YES];
    //picker.view.frame = CGRectMake(100, 100, 100, 100);
    picker.view.hidden = YES;
    
    [NSTimer scheduledTimerWithTimeInterval:2 
                                     target:self 
                                   selector:@selector(startCamera) 
                                   userInfo:nil 
                                    repeats:NO];
}
//-------------------------------------------------------------------
// Remove the picker interface and release the picker object.
//-------------------------------------------------------------------
- (void)removePicker 
{
	[[picker parentViewController] dismissModalViewControllerAnimated:YES];
    [picker release];
}

#pragma mark UIImagePickerControllerDelegate methods
//------------------------------------------------------------------------
// The notification function.
//------------------------------------------------------------------------
- (void)onMoviePlayerControllerNotification:(NSNotification *)notification 
{
	NSLog(@"%@", [notification name]);
	
	if ([[notification name] isEqualToString:MPMoviePlayerLoadStateDidChangeNotification]) {
		// if we have an error we do not start to play the streqm
		NSString *errorKey = @"error";
		for (id key in [notification userInfo]) {
			if ([key isEqualToString:errorKey] == YES) {
				NSLog(@"error");
				return;
			}
		}
	
	} else if ([[notification name] isEqualToString:MPMoviePlayerPlaybackDidFinishNotification]) {
		// create the subviews
		NSLog(@"MPMoviePlayerPlaybackDidFinishNotification");
	} else if ([[notification name] isEqualToString:MPMoviePlayerScalingModeDidChangeNotification]) {
		// Do nothing
        NSLog(@"MPMoviePlayerScalingModeDidChangeNotification");
	} else if ([[notification name] isEqualToString:kMPMediaPlaybackIsPreparedToPlayDidChangeNotification]) {
		NSLog(@"MPMoviePlayerScalingModeDidChangeNotification");
        [player.moviePlayer play];
	} else {
		NSLog(@"not handled notification");
	}
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)imagePickerController:(UIImagePickerController *)pickerLocal didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
	NSString *mediaType = [info objectForKey:@"UIImagePickerControllerMediaType"];
	
	
	if ([kUTTypeImage isEqualToString:mediaType]) {
		UIImage *selectedImage = [[info objectForKey:UIImagePickerControllerOriginalImage] retain];
		
		if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
			;
		}
	}
	else {
        
		NSURL *videoURL = [[info objectForKey:UIImagePickerControllerMediaURL] retain];
		NSLog(@"%@", [videoURL description]);
        NSLog(@"oki!!!");
        
        [self removePicker];
        
        player = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
        player.moviePlayer.view.frame = self.view.frame;
        player.moviePlayer.controlStyle = MPMovieControlStyleDefault;
        player.moviePlayer.useApplicationAudioSession = NO;	
        //player.view.frame = self.view.bounds;
        //player.moviePlayer.view.backgroundColor = [UIColor blackColor];
        //[player.moviePlayer play];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(onMoviePlayerControllerNotification:) 
                                                     name:MPMoviePlayerLoadStateDidChangeNotification 
                                                   object:player.moviePlayer];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(onMoviePlayerControllerNotification:) 
                                                     name:MPMoviePlayerPlaybackDidFinishNotification 
                                                   object:player.moviePlayer];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(onMoviePlayerControllerNotification:) 
                                                     name:MPMoviePlayerScalingModeDidChangeNotification 
                                                   object:player.moviePlayer];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(onMoviePlayerControllerNotification:) 
                                                     name:kMPMediaPlaybackIsPreparedToPlayDidChangeNotification 
                                                   object:player.moviePlayer];
        
        // add it to the main view
        [self.view addSubview:player.moviePlayer.view];
        /*
        MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
		UIImage *selectedImage = [[player thumbnailImageAtTime:1 timeOption:MPMovieTimeOptionNearestKeyFrame] retain];
		[player stop];
		UIImageView *thumbnailImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        thumbnailImage.image = selectedImage;
		[self.view addSubview:thumbnailImage];
		[player release];
        */
        /*
		MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
		selectedImage = [[player thumbnailImageAtTime:1 timeOption:MPMovieTimeOptionNearestKeyFrame] retain];
		[player stop];
		thumbnailImage.image = selectedImage;
		actionLabel.alpha = 0;
		[player release];
		
		if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
			NSString *videoPath=[videoURL path];
			if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(videoPath)) {
				[NSThread detachNewThreadSelector:@selector(startVideoSavingThread) toTarget:self withObject:nil];
			} else {
				TR_WARN(@"video is not compatible with SavedPhotos Album!");
			}
		}
        */
	}
	
	//[self removePicker];
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker 
{
	[self removePicker];
}

@end
