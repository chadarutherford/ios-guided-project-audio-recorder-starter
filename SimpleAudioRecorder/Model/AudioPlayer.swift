//
//  AudioPlayer.swift
//  SimpleAudioRecorder
//
//  Created by Chad Rutherford on 2/11/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import AVFoundation
import Foundation

protocol AudioPlayerDelegate: AnyObject {
    func didPlay()
    func didPause()
    func didUpdate()
    func didFinishPlaying()
}

class AudioPlayer: NSObject {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    weak var delegate: AudioPlayerDelegate?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Playback
}
