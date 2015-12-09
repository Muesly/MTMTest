# MTMTest

Testing an issue with deleting Core Data generated relationship records.  This creates two tracks belonging to a playlist, then deletes each track, then the playlist.  

Inspecting the SQL database after running will show two records in the Z_1PLAYLISTTRACKS table.

This doesn't happen when delayedDeleteSucceeds is run instead of delayedDeleteFails, where the difference is there is a save between deleting the tracks and the playlist.

This appears to only happen when the playlistTracks relationship is ordered.
