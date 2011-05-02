//
//  VCVideos.h
//  GladOrSade
//
//  Created by Emil DUSA on 4/12/11.
//  Copyright 2011 ALU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface VCVideos : UIViewController <UITableViewDataSource,
                                        UITableViewDelegate>{
    
    UIImageView *logoBanner;
    UILabel     *text;
    UITableView *videos;
                                            
    NSMutableArray *videosList;
}
@property (nonatomic, retain) IBOutlet UIImageView *logoBanner;
@property (nonatomic, retain) IBOutlet UILabel *text;
@property (nonatomic, retain) IBOutlet UITableView *videos;

@end
