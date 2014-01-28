//
//  GKPlayer+GKPLoadPhotoForPlayerID.m
//  Plus-iOS
//
//  Created by Maximilian Christ on 7/4/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import "GKPlayer+GKPLoadPhotoForPlayerID.h"

@implementation GKPlayer (GKPLoadPhotoForPlayerID)

+ (void)loadPhotoForPlayerID:(NSString *)playerID size:(GKPhotoSize)size completionHandler:(void(^)(UIImage *image, NSError *error))completionHandler
{
	[GKPlayer loadPlayersForIdentifiers:@[ playerID ] withCompletionHandler:^(NSArray *players, NSError *error) {
		if(error != nil)
		{
			completionHandler(nil, error);
			return;
		}
		
		GKPlayer *player = players.firstObject;
		
		[player loadPhotoForSize:size withCompletionHandler:completionHandler];
	}];
}

@end
