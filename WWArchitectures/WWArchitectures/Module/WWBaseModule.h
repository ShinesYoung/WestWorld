//
//  WWBaseModule.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WWModule.h"

@interface WWBaseModule : NSObject <WWModule>

- (void)welcome;
- (NSString *)moduleName;



@end
