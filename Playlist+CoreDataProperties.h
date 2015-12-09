//
//  Playlist+CoreDataProperties.h
//  MTMTest
//
//  Created by Tony Short on 08/12/2015.
//  Copyright © 2015 Muesly Ltd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Playlist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Playlist (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSOrderedSet<Track *> *playlistTracks;

@end

@interface Playlist (CoreDataGeneratedAccessors)

- (void)insertObject:(Track *)value inPlaylistTracksAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPlaylistTracksAtIndex:(NSUInteger)idx;
- (void)insertPlaylistTracks:(NSArray<Track *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePlaylistTracksAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPlaylistTracksAtIndex:(NSUInteger)idx withObject:(Track *)value;
- (void)replacePlaylistTracksAtIndexes:(NSIndexSet *)indexes withPlaylistTracks:(NSArray<Track *> *)values;
- (void)addPlaylistTracksObject:(Track *)value;
- (void)removePlaylistTracksObject:(Track *)value;
- (void)addPlaylistTracks:(NSOrderedSet<Track *> *)values;
- (void)removePlaylistTracks:(NSOrderedSet<Track *> *)values;

@end

NS_ASSUME_NONNULL_END
