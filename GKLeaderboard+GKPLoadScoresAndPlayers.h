//
//  GKLeaderboard+GKPLoadScoresAndPlayers.h
//  Plus-iOS
//
//  Created by Maximilian Christ on 7/4/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import <GameKit/GameKit.h>

@interface GKLeaderboard (GKPLoadScoresAndPlayers)

- (void)loadScoresAndPlayersWithCompletionHandler:(void(^)(NSArray *scores, NSError *error))completionHandler;

@end
