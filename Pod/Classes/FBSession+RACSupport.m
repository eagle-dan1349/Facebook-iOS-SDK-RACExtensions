//
//  FBSession+RACSupport.m
//  Facebook-iOS-SDK-RACExtensions
//
//  Created by Daniil Orlov on 3/13/15.
//  Copyright (c) 2015 Daniil Orlov. All rights reserved.
//

#import "FBSession+RACSupport.h"

#import <FBError.h>

@implementation FBSession (RACSupport)

#pragma mark - class methods
+ (RACSignal*) rac_openActiveSessionWithReadPermissions:(NSArray*) readPermissions
                                           allowLoginUI:(BOOL) allowLoginUI
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable* (id<RACSubscriber> subscriber)
     {
         [self openActiveSessionWithReadPermissions:readPermissions
                                       allowLoginUI:allowLoginUI
                                  completionHandler:^(FBSession* session, FBSessionState status, NSError* error)
          {
              if (FB_ISSESSIONOPENWITHSTATE(status))
              {
                  [subscriber sendNext:RACTuplePack(session, @(status))];
                  [subscriber sendCompleted];
              }
              else
              {
                  if (!error)
                  {
                      error = [NSError errorWithDomain:FacebookSDKDomain
                                                  code:FBErrorLoginFailedOrCancelled
                                              userInfo:@{
                                                         NSLocalizedDescriptionKey :
                                                             @"User navigated back before login completion."
                                                         }];
                  }
                  
                  [subscriber sendError:error];
              }
          }];
         
         return nil;
     }];
    
    return signal;
}

+ (RACSignal*) rac_openActiveSessionWithPublishPermissions:(NSArray*) publishPermissions
                                           defaultAudience:(FBSessionDefaultAudience) defaultAudience
                                              allowLoginUI:(BOOL) allowLoginUI
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
     {
         [self openActiveSessionWithPublishPermissions:publishPermissions
                                       defaultAudience:defaultAudience
                                          allowLoginUI:allowLoginUI
                                     completionHandler:^(FBSession* session, FBSessionState status, NSError* error)
          {
              if (FB_ISSESSIONOPENWITHSTATE(status))
              {
                  [subscriber sendNext:RACTuplePack(session, @(status))];
                  [subscriber sendCompleted];
              }
              else
              {
                  if (!error)
                  {
                      error = [NSError errorWithDomain:FacebookSDKDomain
                                                  code:FBErrorLoginFailedOrCancelled
                                              userInfo:@{
                                                         NSLocalizedDescriptionKey :
                                                             @"User navigated back before login completion."
                                                         }];
                  }
                  
                  [subscriber sendError:error];
              }
          }];
         
         return nil;
     }];
    
    return signal;
}

+ (RACSignal*) rac_renewSystemCredentials
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
     {
         [self renewSystemCredentials:^(ACAccountCredentialRenewResult result, NSError* error)
         {
             if (!error)
             {
                 [subscriber sendNext:@(result)];
                 [subscriber sendCompleted];
             }
             else
             {
                 [subscriber sendError:error];
             }
         }];
         
         return nil;
     }];
    
    return signal;
}

#pragma mark - authorization

- (RACSignal*) rac_open
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable* (id<RACSubscriber> subscriber)
     {
         [self openWithCompletionHandler:^(FBSession* session, FBSessionState status, NSError* error)
          {
              if (FB_ISSESSIONOPENWITHSTATE(status))
              {
                  [subscriber sendNext:RACTuplePack(session, @(status))];
                  [subscriber sendCompleted];
              }
              else
              {
                  if (!error)
                  {
                      error = [NSError errorWithDomain:FacebookSDKDomain
                                                  code:FBErrorLoginFailedOrCancelled
                                              userInfo:@{
                                                         NSLocalizedDescriptionKey :
                                                             @"User navigated back before login completion."
                                                         }];
                  }
                  
                  [subscriber sendError:error];
              }
          }];
         
         return nil;
     }];
    
    return signal;
}

- (RACSignal*) rac_openWithBehavior:(FBSessionLoginBehavior) behavior
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable* (id<RACSubscriber> subscriber)
     {
         [self openWithCompletionHandler:^(FBSession* session, FBSessionState status, NSError* error)
          {
              if (FB_ISSESSIONOPENWITHSTATE(status))
              {
                  [subscriber sendNext:RACTuplePack(session, @(status))];
                  [subscriber sendCompleted];
              }
              else
              {
                  if (!error)
                  {
                      error = [NSError errorWithDomain:FacebookSDKDomain
                                                  code:FBErrorLoginFailedOrCancelled
                                              userInfo:@{
                                                         NSLocalizedDescriptionKey :
                                                             @"User navigated back before login completion."
                                                         }];
                  }
                  
                  [subscriber sendError:error];
              }
          }];
         
         return nil;
     }];
    
    return signal;
}

- (RACSignal*) rac_openFromAccessTokenData:(FBAccessTokenData*) accessTokenData
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable* (id<RACSubscriber> subscriber)
     {
         [self openFromAccessTokenData:accessTokenData
                     completionHandler:^(FBSession* session, FBSessionState status, NSError* error)
          {
              if (FB_ISSESSIONOPENWITHSTATE(status))
              {
                  [subscriber sendNext:RACTuplePack(session, @(status))];
                  [subscriber sendCompleted];
              }
              else
              {
                  if (!error)
                  {
                      error = [NSError errorWithDomain:FacebookSDKDomain
                                                  code:FBErrorLoginFailedOrCancelled
                                              userInfo:@{
                                                         NSLocalizedDescriptionKey :
                                                             @"User navigated back before login completion."
                                                         }];
                  }
                  
                  [subscriber sendError:error];
              }
          }];
         
         return nil;
     }];
    
    return signal;
}

#pragma mark - permisions

- (RACSignal*) rac_requestNewReadPermissions:(NSArray*) readPermissions
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable* (id<RACSubscriber> subscriber)
     {
         [self requestNewReadPermissions:readPermissions
                       completionHandler:^(FBSession* session, NSError* error)
          {
              if (!error)
              {
                  [subscriber sendNext:session];
                  [subscriber sendCompleted];
              }
              else
              {
                  [subscriber sendError:error];
              }
          }];
         
         return nil;
     }];
    
    return signal;
}

- (RACSignal*) rac_requestNewPublishPermissions:(NSArray*) writePermissions
                                defaultAudience:(FBSessionDefaultAudience) defaultAudience
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
     {
         [self requestNewPublishPermissions:writePermissions
                            defaultAudience:defaultAudience
                          completionHandler:^(FBSession* session, NSError* error)
          {
              if (!error)
              {
                  [subscriber sendNext:session];
                  [subscriber sendCompleted];
              }
              else
              {
                  [subscriber sendError:error];
              }
          }];
         
         return nil;
     }];
    
    return signal;
}

- (RACSignal*) rac_refreshPermissions
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
     {
         [self refreshPermissionsWithCompletionHandler:^(FBSession* session, NSError* error)
          {
              if (!error)
              {
                  [subscriber sendNext:session];
                  [subscriber sendCompleted];
              }
              else
              {
                  [subscriber sendError:error];
              }
          }];
         
         return nil;
     }];
    
    return signal;
}

@end
