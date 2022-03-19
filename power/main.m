#include <stdio.h>
#import "UIKit/UIKit.h"
#import "NSTask.h"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

void runCommand(NSString *cmd) {
	NSTask *task = [[NSTask alloc] init];
	[task setLaunchPath:@"/bin/sh"];
	[task setArguments:@[@"-c", cmd]];
	[task launch];
	[task waitUntilExit];
}

int main(int argc, char *argv[], char *envp[]) {

	if(argc != 2) {
		printf("Invalid argument (or arguments) was provided!\n");
		return 1;
	}

	setuid(0);
	setgid(0);

	if(strcmp(argv[1], "reboot") == 0) {
		NSString *cmd = [NSString stringWithFormat:@"reboot"];
		runCommand(cmd);
	} else if(strcmp(argv[1], "shutdown") == 0) {
		NSString *cmd = [NSString stringWithFormat:@"halt"];
		runCommand(cmd);
	}

	return 0;
}
