//
//  TopSongsAppDelegate.m
//  TopSongs
//
//  Created by Chad Eubanks on 5/19/11.
//  Copyright 2011 The Code Boutique. All rights reserved.
//

#import "TopSongsAppDelegate.h"
#import "RSSTableViewController.h"

@implementation TopSongsAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
	RSSTableViewController *tvc = [[[RSSTableViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
	[window setRootViewController:tvc];
    [window makeKeyAndVisible];
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
