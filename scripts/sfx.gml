#define sfx
if !oAudio.mute return audio_play_sound(argument0,51,false);

#define pickupsfx
///pickupsfx()
if !oAudio.mute {
    var psfx = audio_play_sound(argument0,51,false);
    audio_sound_pitch(psfx,oAudio.pickupPitch);
    
    oAudio.alarm[0] = 120; // reset pitch
}

#define music_loop
music_stop();
var soundID = audio_play_sound(argument0,10,true);
if oAudio.mute audio_sound_gain(soundID,0,0) else audio_sound_gain(soundID,oAudio.volume,0);

oAudio.musicPlaying = soundID;
return soundID;

#define music_stop
audio_stop_all();
#define music_slow
audio_sound_pitch(oAudio.musicPlaying,.5);

#define music_normalSpeed
audio_sound_pitch(oAudio.musicPlaying,1);