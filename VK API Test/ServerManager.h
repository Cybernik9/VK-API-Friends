//
//  ServerManager.h
//  VK API Test
//
//  Created by Admin on 23.09.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerManager : NSObject

+ (ServerManager*) sharedManager;

- (void) getFriendsWithOffset:(NSInteger) offset
                        count:(NSInteger) count
                    onSuccess:(void(^)(NSArray* friends)) success
                    onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

@end
