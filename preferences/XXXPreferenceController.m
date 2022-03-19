#import "XXXPreferenceController.h"

@implementation XXXPreferenceController

- (void)reboot {
	NSTask *task = [[NSTask alloc] init];
	[task setLaunchPath:@"/usr/libexec/power"];
	[task setArguments:@[@"reboot"]];
	[task launch];
	[task waitUntilExit];
}

- (void)shutdown {
	NSTask *task = [[NSTask alloc] init];
	[task setLaunchPath:@"/usr/libexec/power"];
	[task setArguments:@[@"shutdown"]];
	[task launch];
	[task waitUntilExit];
}

@end
