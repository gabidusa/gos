#include <stdlib.h>
#import "AVCameraViewController.h"
#import "Trace.h"

@interface AVCameraViewController()

- (void)startRecord;
- (void)stopRecord;

@end

@implementation AVCameraViewController

@synthesize outputUrl = _outputUrl;

#pragma mark -
#pragma mark Initialization
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (id)init 
{
	self = [super init];
	if (self) {
		// we initialize some variables
        _outputUrl = nil;
	}
	return self;
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)viewDidLoad 
{
	
}

#pragma mark -
#pragma mark Memory management
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)viewDidUnload 
{

}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)dealloc 
{
	[_captureSession release];
    [_captureOutput release];
    [_captureInput release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Public
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)startRecord
{
    // create now the file output
    if (!_captureOutput) {
        _captureOutput = [[AVCaptureMovieFileOutput alloc] init];
    }
    
    // add the output to the session
    [_captureSession addOutput:_captureOutput];
    //[_captureSession addOutput:_captureOutput];
    
    NSString *fileName = [NSString stringWithFormat:@"movieTmp%@.mov", [[NSDate date] description]];
    NSString *outputPath = [[NSString alloc] initWithFormat:@"%@%@", NSTemporaryDirectory(), fileName];
	self.outputUrl  = [[NSURL alloc] initFileURLWithPath:outputPath];
    if (self.outputUrl) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:outputPath]) {
            NSError *error;
            [[NSFileManager defaultManager] removeItemAtPath:outputPath error:&error];
            if (error) {
                TR_ERROR(@"%@",[error description]);
            }
        }
        
        [_captureOutput startRecordingToOutputFileURL:self.outputUrl 
                                      recordingDelegate:self];   
    }
    [outputPath release];
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)stopRecord
{
    [_captureOutput stopRecording];
    // remove the outputs of the session
    [_captureSession removeOutput:_captureOutput];
}

#pragma mark -
#pragma mark Public
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)initCapture
{
	// setup the input
    AVCaptureDevice *captureDevice = nil;
    NSArray *devices = [AVCaptureDevice devices];
    for (AVCaptureDevice *device in devices) {
        TR_INFO(@"Device name: %@", [device localizedName]);
        if ([device hasMediaType:AVMediaTypeVideo]) {
            if ([device position] == AVCaptureDevicePositionBack) {
                TR_INFO(@"Device position : back");
            }
            else {
                TR_INFO(@"Device position : front");
            }
            captureDevice = device;
            break;
        }
    }
    if (!captureDevice) {
        TR_INFO(@"No camera found!");
        return;
    }
    
	_captureInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice
                                                          error:nil];
	// and we create a capture session
	_captureSession = [[AVCaptureSession alloc] init];
	// we add input
	[_captureSession addInput:_captureInput];
    
    // we create also the preview layer
    _prevLayer = [AVCaptureVideoPreviewLayer layerWithSession:_captureSession];
	_prevLayer.frame = self.view.bounds;
	_prevLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
	[self.view.layer addSublayer:_prevLayer];
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)startCapture
{
    [_captureSession startRunning];
    // start the recording to file
    [self startRecord];
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)stopCapture
{
    [_captureSession stopRunning];
    // stop the recording to file
    [self stopRecord];
}
 
#pragma mark -
#pragma AVCaptureFileOutputRecordingDelegate
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didStartRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections
{
    TR_INFO(@"didStartRecordingToOutputFileAtURL");
}
//-------------------------------------------------------------------
// .
//-------------------------------------------------------------------
- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error
{
    TR_INFO(@"didFinishRecordingToOutputFileAtURL");
    TR_INFO(@"outputFileURL: %@", outputFileURL);
    TR_INFO(@"error: %@", [error localizedDescription]);
}
@end