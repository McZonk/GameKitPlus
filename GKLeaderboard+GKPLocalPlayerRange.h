//
//  GKLeaderboard+GKPLocalPlayerRange.h
//  Plus-iOS
//
//  Created by Maximilian Christ on 6/16/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import <GameKit/GameKit.h>

@interface GKLeaderboard (GKPLocalPlayerRange)

- (void)loadScoresAroundLocalPlayerBefore:(NSUInteger)before after:(NSUInteger)after completionHandler:(void(^)(NSArray *scores, NSError *error))completionHandler;

- (void)loadScoresAndPlayersAroundLocalPlayerBefore:(NSUInteger)before after:(NSUInteger)after completionHandler:(void(^)(NSArray *scores, NSError *error))completionHandler;

@end
