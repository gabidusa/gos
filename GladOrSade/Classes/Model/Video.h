//
//  Video.h
//  GladOrSade
//
//  Created by Emil DUSA on 4/12/11.
//  Copyright 2011 ALU. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Video : NSObject {
    NSString *_Id;
    NSString *_title;
    NSString *_url;
    NSString *_thumbnailUrl;
}

@property(nonatomic, readonly) NSString *Id;
@property(nonatomic, readonly) NSString *title;
@property(nonatomic, readonly) NSString *url;
@property(nonatomic, readonly) NSString *thumbnailUrl;

- (id)initWithId:(NSString*)Id
       withTitle:(NSString*)title
         withUrl:(NSString*)url
      andLogoUrl:(NSString*)logoUrl;

@end
