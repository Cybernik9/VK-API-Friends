//
//  ServerManager.m
//  VK API Test
//
//  Created by Admin on 23.09.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "ServerManager.h"
#import "AFNetworking.h"
#import "User.h"

@interface ServerManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager* requestOperationManager;

@end

@implementation ServerManager

+ (ServerManager*) sharedManager {
    
    static ServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    
    return manager;
}

- (id) init {
    
    self = [super init];
    
    if (self) {
        NSURL* url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    }
    
    return self;
}

- (void) getFriendsWithOffset:(NSInteger) offset
                        count:(NSInteger) count
                    onSuccess:(void(^)(NSArray* friends)) success
                    onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure {

    NSDictionary* params =
    [NSDictionary dictionaryWithObjectsAndKeys:
                            @"21858221", @"user_id",
                            @"name", @"order",
                            @(count), @"count",
                            @(offset), @"offset",
                            @"photo_50", @"fields",
                            @"nom", @"name_case", nil];
  
    
    [self.requestOperationManager
     GET:@"friends.get"
     parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
         
         NSArray* dictsArray = [responseObject objectForKey:@"response"];
         
         NSMutableArray* objectsArray = [NSMutableArray array];
         
         for (NSDictionary* dict in dictsArray) {
             User* user = [[User alloc] initWithServerResponse:dict];
             [objectsArray addObject:user];
         }
         
         if (success) {
             success(objectsArray);
         }
         
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        if (failure) {
            failure(error, operation.response.statusCode);
        }
    }];
    
}

/*
 friends.get
 
 user_id 21858221
 order name
 count
 offset
 fields photo_50
 
 name_case nom

 */

@end
