#include "XXXProvider.h"

@implementation XXXProvider

#pragma mark Initialization

+ (CSPreferencesProvider *)sharedProvider {
    static dispatch_once_t once;
    static CSPreferencesProvider *sharedProvider;
    dispatch_once(&once, ^{

        NSString *tweakId = @"com.mintod.power";
        NSString *prefsNotification = [tweakId stringByAppendingString:@".prefschanged"];
        NSString *defaultsPath = @"/Library/PreferenceBundles/Power.bundle/defaults.plist";

        sharedProvider = [[CSPreferencesProvider alloc] initWithTweakID:tweakId defaultsPath:defaultsPath postNotification:prefsNotification notificationCallback:^void (CSPreferencesProvider *provider) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"XXXSettingsChanged" object:nil userInfo:nil];
        }];

    });
    return sharedProvider;
}

@end
