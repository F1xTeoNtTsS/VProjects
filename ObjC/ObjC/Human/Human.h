//
//  Human.h
//  ObjC
//
//  Created by F1xTeoNtTsS on 14.07.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Human : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger* age;

- (void) sayHello;

@end

NS_ASSUME_NONNULL_END
