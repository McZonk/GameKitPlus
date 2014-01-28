//
//  GKLeaderboard+GKPLocalPlayerRange.m
//  Plus-iOS
//
//  Created by Maximilian Christ on 6/16/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import "GKLeaderboard+GKPLocalPlayerRange.h"

#import "GKLeaderboard+GKPLoadScoresAndPlayers.h"


@implementation GKLeaderboard (GKPLocalPlayerRange)

- (void)loadScoreRangesAroundLocalPlayerBefore:(NSUInteger)before after:(NSUInteger)after completionHandler:(void(^)(NSError *error))completionHandler
{
	// only load local players score
	self.range = NSMakeRange(1, 1);

	[self loadScoresWithCompletionHandler:^(NSArray *scores, NSError *error) {
		if(error != nil)
		{
			completionHandler(error);
			return;
		}
		
		GKScore *score = self.localPlayerScore;
		
		// rank is starting from 1
		const NSUInteger rank = score.rank;
		const NSUInteger maxRange = self.maxRange;
		
		NSInteger start = rank - before;
		if(start < 1)
		{
			start = 1;
		}
		
		NSUInteger end = rank + after;
		if(end > maxRange)
		{
			end = maxRange;
		}
		
		self.range = NSMakeRange(start, end + 1 - start);
		
		completionHandler(nil);
	}];
}

- (void)loadScoresAroundLocalPlayerBefore:(NSUInteger)before after:(NSUInteger)after completionHandler:(void(^)(NSArray *scores, NSError *error))completionHandler
{
	[self loadScoreRangesAroundLocalPlayerBefore:before after:after completionHandler:^(NSError *error) {
		if(error != nil)
		{
			completionHandler(nil, error);
			return;
		}
		
		[self loadScoresWithCompletionHandler:completionHandler];
	}];
}

- (void)loadScoresAndPlayersAroundLocalPlayerBefore:(NSUInteger)before after:(NSUInteger)after completionHandler:(void(^)(NSArray *scores, NSError *error))completionHandler
{
	[self loadScoreRangesAroundLocalPlayerBefore:before after:after completionHandler:^(NSError *error) {
		if(error != nil)
		{
			completionHandler(nil, error);
			return;
		}
		
		[self loadScoresAndPlayersWithCompletionHandler:completionHandler];
	}];
}

@end
