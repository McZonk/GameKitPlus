//
//  GKScore+GKPReportScore.m
//  Plus-iOS
//
//  Created by Maximilian Christ on 6/17/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import "GKScore+GKPReportScore.h"

@implementation GKScore (GKPReportScore)

+ (void)reportScore:(GKScore *)score completionHandlerWithDefeatedScore:(void(^)(NSArray *deafeatedScores, NSError *error))completionHandler
{
	GKLeaderboard* leaderboard = [[GKLeaderboard alloc] init];
#if 1
	leaderboard.identifier = score.leaderboardIdentifier;
#else
	leaderboard.category = score.category; // iOS6
#endif
	leaderboard.timeScope = GKLeaderboardTimeScopeAllTime;
	leaderboard.playerScope = GKLeaderboardPlayerScopeFriendsOnly;
	leaderboard.range = NSMakeRange(1, 1);
	
	[leaderboard loadScoresWithCompletionHandler:^(NSArray *scores, NSError *error) {
		GKScore *localScore = leaderboard.localPlayerScore;

		if(error == nil && localScore != nil)
		{
			const NSUInteger rank = localScore.rank;
			
			leaderboard.range = NSMakeRange(rank > 20 ? rank - 20 : 1, rank > 20 ? 20 : rank - 1);
			
			[leaderboard loadScoresWithCompletionHandler:^(NSArray *scores, NSError *error) {
				NSMutableArray *defeatedScores = [NSMutableArray array];

				if(error == nil)
				{
					for(GKScore* defeatedScore in scores)
					{
						if(defeatedScore.value < score.value)
						{
							[defeatedScores addObject:defeatedScore];
						}
					}
				}
				
				[GKScore reportScores:@[ score ] withCompletionHandler:^(NSError *error) {
					if(completionHandler != nil)
					{
						completionHandler(error == nil ? defeatedScores : nil, error);
					}
				}];
			}];
		}
		else
		{
			[GKScore reportScores:@[ score ] withCompletionHandler:^(NSError *error) {
				if(completionHandler != nil)
				{
					completionHandler(error == nil ? @[] : nil, error);
				}
			}];
		}
	}];
	
}

@end
