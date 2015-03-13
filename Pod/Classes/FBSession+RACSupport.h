//
//  FBSession+RACSupport.h
//  Facebook-iOS-SDK-RACExtensions
//
//  Created by Daniil Orlov on 3/13/15.
//  Copyright (c) 2015 Daniil Orlov. All rights reserved.
//

#import <FBSession.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

/**
 *  Note that navigating back to your application before login is finished
 *  Was causing authorisation to fail in inconvince way: with no error.
 *  This case is handled now, and will lead to error with code FBErrorLoginFailedOrCancelled
 */
@interface FBSession (RACSupport)

#pragma mark - class methods

/**
 *  Convince around -openActiveSessionWithReadPermissions:allowLoginUI:completionHandler:
 *  @return A cold signal of resulting session and state tuple or error
 */
+ (RACSignal*) rac_openActiveSessionWithReadPermissions:(NSArray*) readPermissions
                                           allowLoginUI:(BOOL) allowLoginUI;

/**
 *  Convince around -openActiveSessionWithPublishPermissions:defaultAudience:allowLoginUI:completionHandler:
 *  @return A cold signal of resulting session and state tuple or error
 */
+ (RACSignal*) rac_openActiveSessionWithPublishPermissions:(NSArray *)publishPermissions
                                           defaultAudience:(FBSessionDefaultAudience)defaultAudience
                                              allowLoginUI:(BOOL)allowLoginUI;

/**
 *  Convince around -renewSystemCredentials:
 *  @return A cold signal of result or error
 */
+ (RACSignal*) rac_renewSystemCredentials;

#pragma mark - authorization

/**
 *  Convince around -openWithCompletionHandler:
 *  @return A cold signal of the resulting session and state tuple or error.
 */
- (RACSignal*) rac_open;

/**
 *  Convince around -openWithWithBehavior:completionHandler:
 *  @return A cold signal of the resulting session and state tuple or error.
 */
- (RACSignal*) rac_openWithBehavior:(FBSessionLoginBehavior) behavior;

/**
 *  Convince around -openFromAccessTokenData:completionHandler:
 *  @return A cold signal of the resulting session and state tuple or error.
 */
- (RACSignal*) rac_openFromAccessTokenData:(FBAccessTokenData*) accessTokenData;

#pragma mark - permissions

/**
 *  Convince around -requestNewReadPermissions:completionHandler:
 *  @return A cold signal of resulting session or error.
 */
- (RACSignal*) rac_requestNewReadPermissions:(NSArray*) readPermissions;

/**
 *  Convince around -requestNewPublishPermissions:defaultAudience:completionHandler:
 *  @return A cold signal of resulting session or error.
 */
- (RACSignal*) rac_requestNewPublishPermissions:(NSArray *)writePermissions
                                defaultAudience:(FBSessionDefaultAudience)defaultAudience;

/**
 *  Convince around -refreshPermissionsWithCompletionHandler:
 *  @return A cold signal of resulting session or error.
 */
- (RACSignal*) rac_refreshPermissions;

@end
