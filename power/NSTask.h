#import <Foundation/Foundation.h>

@interface NSTask : NSObject

- (void)launch;
- (void)setLaunchPath:(id)arg1;
- (void)setArguments:(id)arg1;
- (void)waitUntilExit;

@end