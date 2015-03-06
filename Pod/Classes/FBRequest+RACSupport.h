//
//  FBRequest+RACSupport.h
//  Facebook-iOS-SDK-RACExtensions
//
//  Created by Daniil Orlov on 3/5/15.
//  Copyright (c) 2015 Daniil Orlov. All rights reserved.
//

#import <FBRequest.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface FBRequest (RACSupport)

/**
 *  Convince method around -startWithCompletionHandler:
 *  @return A cold signal of the resulting Graph object or error.
 */
- (RACSignal*) rac_start;

@end
