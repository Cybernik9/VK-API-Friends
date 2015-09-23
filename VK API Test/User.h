//
//  User.h
//  VK API Test
//
//  Created by Admin on 23.09.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSURL* imageURL;

- (id) initWithServerResponse:(NSDictionary*) responseObject;

@end
