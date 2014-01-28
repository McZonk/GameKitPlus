//
//  GKLeaderboard+GKPLoadScoresAndPlayers.m
//  Plus-iOS
//
//  Created by Maximilian Christ on 7/4/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import "GKLeaderboard+GKPLoadScoresAndPlayers.h"

#import "GKScore+GKPPlayer.h"

@implementation GKLeaderboard (GKPLoadScoresAndPlayers)

- (void)loadScoresAndPlayersWithCompletionHandler:(void(^)(NSArray *scores, NSError *error))completionHandler
{
	[self loadScoresWithCompletionHandler:^(NSArray *scores, NSError *error) {
		if(error != nil)
		{
			if(completionHandler != nil)
			{
				completionHandler(nil, error);
			}
			return;
		}
		
		NSArray *playerIDs = [scores valueForKeyPath:@"playerID"];

		[GKPlayer loadPlayersForIdentifiers:playerIDs withCompletionHandler:^(NSArray *players_, NSError *error) {
			NSDictionary* players = [NSDictionary dictionaryWithObjects:players_ forKeys:[players_ valueForKeyPath:@"playerID"]];
			
			for(GKScore *score in scores)
			{
				score.player = players[score.playerID];
			}

			if(completionHandler != nil)
			{
				completionHandler(error == nil ? scores : nil, error);
			}
		}];
		
	}];
}

@end
