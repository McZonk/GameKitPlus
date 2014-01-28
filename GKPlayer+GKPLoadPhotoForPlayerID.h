//
//  GKPlayer+GKPLoadPhotoForPlayerID.h
//  Plus-iOS
//
//  Created by Maximilian Christ on 7/4/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import <GameKit/GameKit.h>

@interface GKPlayer (GKPLoadPhotoForPlayerID)

+ (void)loadPhotoForPlayerID:(NSString *)playerID size:(GKPhotoSize)size completionHandler:(void(^)(UIImage *image, NSError *error))completionHandler;

@end
