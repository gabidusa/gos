#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>

@interface AVCameraViewController : UIViewController <AVCaptureFileOutputRecordingDelegate> {
@private
	AVCaptureSession            *_captureSession;
    AVCaptureDeviceInput        *_captureInput;
    AVCaptureMovieFileOutput    *_captureOutput;
    NSURL                       *_outputUrl;
    AVCaptureVideoPreviewLayer  *_prevLayer;
}

@property (nonatomic, retain) NSURL *outputUrl;

- (void)initCapture;
- (void)startCapture;
- (void)stopCapture;

@end