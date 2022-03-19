#include <CSPreferences/CSPreferencesProvider.h>
#define prefs [XXXProvider sharedProvider]

@interface XXXProvider : NSObject

+ (CSPreferencesProvider *)sharedProvider;

@end