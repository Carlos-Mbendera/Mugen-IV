//
//  MiDi.swift
//  Mugen IV
//
//  Created by Carlos Mbendera on 03/06/2022.
//

import Foundation
import AudioToolbox



func playMiDi() {
    //MARK: - Setting up MiDi
    
    var mSequence: MusicSequence? = nil
    var musicSequenceStatus: OSStatus = NewMusicSequence(&mSequence)
    
    var mTrack: MusicTrack? = nil
    var musicTrackStatus: OSStatus = MusicSequenceNewTrack(mSequence!, &mTrack)
    
    var mTime: MusicTimeStamp = MusicTimeStamp(1.0)
    
    // MARK: - According to the guide 84 = A5
    
    var rootNote: UInt8 = 72
  
    // Root Note + 4 results in Third, +7 is Fifth, + 11 is Seventh
    
    var midiArray = [MIDINoteMessage(channel: 0,
                                                         note: rootNote,
                                                         velocity: 100,
                                                         releaseVelocity: 0,
                                                         duration: 1.0)
                          
                    ,MIDINoteMessage(channel: 0,
                                                         note: rootNote + 4,
                                                         velocity: 100,
                                                         releaseVelocity: 0,
                                                         duration: 1.0)
                          
                      ,MIDINoteMessage(channel: 0,
                                                         note: rootNote + 7,
                                                         velocity: 100,
                                                         releaseVelocity: 0,
                                                         duration: 1.0)
                     ,MIDINoteMessage(channel: 0,
                                                        note: rootNote + 11,
                                                        velocity: 100,
                                                        releaseVelocity: 0,
                                                        duration: 1.0)]
            
    for (index, midiNote) in midiArray.enumerated(){
        
            var midiTrack = MusicTrackNewMIDINoteEvent(mTrack!, mTime, &midiArray[index])
        
        //MARK: - Music Player that plays it
        
        var musicPlayer: MusicPlayer? = nil
        
        var player = NewMusicPlayer(&musicPlayer)
        
        player = MusicPlayerSetSequence(musicPlayer!, mSequence)
        
        player = MusicPlayerStart(musicPlayer!)
    
    }
    
}
