//
//  User.m
//  VK API Test
//
//  Created by Admin on 23.09.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "User.h"

@implementation User

- (id) initWithServerResponse:(NSDictionary*) responseObject {
    
    self = [super init];
    
    if (self) {
        
        self.firstName = [responseObject objectForKey:@"first_name"];
        self.lastName = [responseObject objectForKey:@"last_name"];
        
        NSString* urlString = [responseObject objectForKey:@"photo_50"];
        
        if (urlString) {
            self.imageURL = [NSURL URLWithString:urlString];
        }
    }
    return self;
}

@end
