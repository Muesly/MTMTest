//
//  Track+CoreDataProperties.h
//  MTMTest
//
//  Created by Tony Short on 08/12/2015.
//  Copyright © 2015 Muesly Ltd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Track.h"

NS_ASSUME_NONNULL_BEGIN

@interface Track (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Playlist *> *playlists;

@end

@interface Track (CoreDataGeneratedAccessors)

- (void)addPlaylistsObject:(Playlist *)value;
- (void)removePlaylistsObject:(Playlist *)value;
- (void)addPlaylists:(NSSet<Playlist *> *)values;
- (void)removePlaylists:(NSSet<Playlist *> *)values;

@end

NS_ASSUME_NONNULL_END
