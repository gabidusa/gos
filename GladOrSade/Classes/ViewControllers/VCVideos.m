//
//  VCVideos.m
//  GladOrSade
//
//  Created by Emil DUSA on 4/12/11.
//  Copyright 2011 ALU. All rights reserved.
//

#import "VCVideos.h"
#import "Customization.h"
#import "VideoCellView.h"
#import "VCMgr.h"

@implementation VCVideos
@synthesize logoBanner;
@synthesize text;
@synthesize videos;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        videosList = [[NSMutableArray alloc] initWithCapacity:10];
        for (int i = 0; i < 10; i++) {
            NSString *url = [NSString stringWithFormat:@"http://159.217.145.55/demo/%d.m3u8", i];
            Video *video = [[Video alloc] initWithId:[NSString stringWithFormat:@"%d", i] withTitle:[NSString stringWithFormat:@"Video %d", i] withUrl:url andLogoUrl:nil];   
            
            [videosList addObject:video];
            
            [video release];
        }
    }
    return self;
}

- (void)dealloc
{
    [logoBanner release];
    [text release];
    [videos release];
    [videosList release];
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
    // text
    self.text.text = [Customization string:STRING_SELECT_VIDEOS];
    // videos
    self.videos.delegate = self;
    self.videos.dataSource = self;
    [self.videos reloadData];
}

- (void)viewDidUnload
{
    [self setLogoBanner:nil];
    [self setText:nil];
    [self setVideos:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [videosList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"VideoCell";
    
    VideoCellView *cell = (VideoCellView *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        // create a new cell
        cell = [[[VideoCellView alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // update the cell
    Video *video = [videosList objectAtIndex:indexPath.row];
    cell.textLabel.text = video.title;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Video *video = [videosList objectAtIndex:indexPath.row];
    
    VCMgr *mgr = (VCMgr*)self.parentViewController;
    [mgr showScreen:ScreenRecord 
          withParam:video];
}
@end
