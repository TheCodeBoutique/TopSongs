    //
//  RSSTableViewController.m
//  TopSongs
//
//  Created by Chad Eubanks on 5/19/11.
//  Copyright 2011 The Code Boutique. All rights reserved.
//

#import "RSSTableViewController.h"


@implementation RSSTableViewController

// Instantiate songs //
- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        songs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return [songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier: @"UITableViewCell"] autorelease];
    }
    
    [[cell textLabel] setText:[songs objectAtIndex:[indexPath row]]];
    return cell;
}

- (void)loadSongs
{
    [songs removeAllObjects];
    [[self tableView] reloadData];
    
    // Construct the web service URL
    NSURL *url = [NSURL URLWithString:@"http://ax.itunes.apple.com/"
                  @"WebObjects/MZStoreServices.woa/ws/RSS/topsongs/"
                  @"limit=10/xml"];
    
    // Create a request object with that URL
    NSURLRequest *request = 
    [NSURLRequest requestWithURL:url cachePolicy:(NSURLRequestReloadIgnoringCacheData) timeoutInterval:30];
    
    // Clear out the exsisting connection if there is one
    if (connectionInProgress) {
        [connectionInProgress cancel];
        [connectionInProgress release];
    }
    
    // Instantiate the object to hold all incoming data
    [xmlData release];
    xmlData = [[NSMutableData alloc] init];
    
    // Create and initiate the connection - non-blocking
    connectionInProgress = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadSongs];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
