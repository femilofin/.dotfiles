output = ''
if (Application('Deezer').playerState() == 'playing') {
   const track = Application('Deezer').loadedTrack
   const track_title = track.title()
   const track_artist = track.artist()
   output = (`♫ ${track_title} - ${track_artist}`).substr(0, 50);
}

output;
