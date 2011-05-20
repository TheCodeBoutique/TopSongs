//
//  RSSTableViewController.h
//  TopSongs
//
//  Created by Chad Eubanks on 5/19/11.
//  Copyright 2011 The Code Boutique. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RSSTableViewController : UITableViewController <NSXMLParserDelegate> {
	BOOL waitingForEntryTitle;
	NSMutableArray *songs;
    NSMutableData *xmlData; 
	NSURLConnection *connectionInProgress; 
	NSMutableString *titleString;
}
- (void)loadSongs;
@end
