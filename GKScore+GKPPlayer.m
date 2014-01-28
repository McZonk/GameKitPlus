//
//  GKScore+GKPPlayer.m
//  Plus-iOS
//
//  Created by Maximilian Christ on 7/4/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import "GKScore+GKPPlayer.h"

#import <objc/runtime.h>

static const void * const GKScorePlayerKey = (const void*)&GKScorePlayerKey;


@implementation GKScore (GKPPlayer)

- (GKPlayer *)player
{
	return objc_getAssociatedObject(self, GKScorePlayerKey);
}

- (void)setPlayer:(GKPlayer *)player
{
	objc_setAssociatedObject(self, GKScorePlayerKey, player, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
