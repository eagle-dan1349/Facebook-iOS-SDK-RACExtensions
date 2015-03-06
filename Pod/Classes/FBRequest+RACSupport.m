//
//  FBRequest+RACSupport.m
//  Facebook-iOS-SDK-RACExtensions
//
//  Created by Daniil Orlov on 3/5/15.
//  Copyright (c) 2015 Daniil Orlov. All rights reserved.
//

#import "FBRequest+RACSupport.h"

@implementation FBRequest (RACSupport)

- (RACSignal*) rac_start
{
    RACSignal* signal =
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
     {
         [self startWithCompletionHandler:
          ^(FBRequestConnection* connection, id result, NSError* error)
          {
              if (!error)
              {
                  [subscriber sendNext:result];
                  [subscriber sendCompleted];
              }
              else
              {
                  [subscriber sendError:error];
              }
          }];
         
         return
         [RACDisposable disposableWithBlock:^
          {
              [_connection cancel];
          }];
     }];
    
    return signal;
}

@end
