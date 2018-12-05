//
//  WWInvokeArgusProcessor.h
//  WWFoundation
//
//  Created by Shines Young on 2018/12/5.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WWInvokeArgusProcessor : NSObject

+ (void)handleInvocation:(NSInvocation *)invocation
               arguCType:(const char *)arguCType
                argument:(id)aArgument
                 atIndex:(NSUInteger)index;

@end
