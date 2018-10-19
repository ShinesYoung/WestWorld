//
//  WWUrlPatternItem.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/28.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWUrlPatternItem : NSObject

@property (nonatomic, copy) NSString *urlPattern;
@property (nonatomic, copy) NSString *moduleName;
@property (nonatomic, copy) NSString *actionName;
@property (nonatomic, copy) NSString *argPattern;

@end
