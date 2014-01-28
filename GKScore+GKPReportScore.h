//
//  GKScore+GKPReportScore.h
//  Plus-iOS
//
//  Created by Maximilian Christ on 6/17/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import <GameKit/GameKit.h>

@interface GKScore (GKPReportScore)

+ (void)reportScore:(GKScore *)score completionHandlerWithDefeatedScore:(void(^)(NSArray *defeatedScores, NSError *error))completionHandler;

@end
