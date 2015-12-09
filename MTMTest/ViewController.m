//
//  ViewController.m
//  MTMTest
//
//  Created by Tony Short on 08/12/2015.
//  Copyright © 2015 Muesly Ltd. All rights reserved.
//

#import <objc/runtime.h>
#import "ViewController.h"
#import "Playlist.h"
#import "Track.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	AppDelegate *ap = (AppDelegate*)([UIApplication sharedApplication].delegate);
	NSManagedObjectContext *moc = [ap managedObjectContext];

	Playlist *playlist = [NSEntityDescription insertNewObjectForEntityForName:@"Playlist" inManagedObjectContext:moc];
	playlist.name = @"Playlist";

	Track *track = [NSEntityDescription insertNewObjectForEntityForName:@"Track" inManagedObjectContext:moc];
	track.name = @"Track 1";
	[track addPlaylistsObject:playlist];
	
	Track *track2 = [NSEntityDescription insertNewObjectForEntityForName:@"Track" inManagedObjectContext:moc];
	track2.name = @"Track 2";
	[track2 addPlaylistsObject:playlist];

	[moc save:nil];
	
	[self performSelector:@selector(delayedDeleteFails) withObject:nil afterDelay:1];
//	[self performSelector:@selector(delayedDeleteSucceeds) withObject:nil afterDelay:1];
}

-(void)delayedDeleteFails
{
	NSManagedObjectContext *moc = ((AppDelegate*)[UIApplication sharedApplication].delegate).managedObjectContext;
	
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	[fetchRequest setEntity:[NSEntityDescription entityForName:@"Playlist" inManagedObjectContext:moc]];

	NSError *error = nil;
	NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];

	Playlist *playlist = fetchedObjects.firstObject;
	for(Track *track in playlist.playlistTracks)
		[moc deleteObject:track];
	[moc deleteObject:playlist];

	[moc save:&error];
}

-(void)delayedDeleteSucceeds
{
	NSManagedObjectContext *moc = ((AppDelegate*)[UIApplication sharedApplication].delegate).managedObjectContext;
	
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	[fetchRequest setEntity:[NSEntityDescription entityForName:@"Playlist" inManagedObjectContext:moc]];
	
	NSError *error = nil;
	NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
	
	Playlist *playlist = fetchedObjects.firstObject;
	for(Track *track in playlist.playlistTracks)
		[moc deleteObject:track];

	[moc save:&error];
	[moc deleteObject:playlist];
	[moc save:&error];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
