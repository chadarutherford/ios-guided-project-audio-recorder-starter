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
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    weak var delegate: AudioPlayerDelegate?
    var isPlaying: Bool {
        audioPlayer?.isPlaying ?? false
    }
    
    func loadAudio() {
        guard let songURL = Bundle.main.url(forResource: "papaRoach", withExtension: "m4a") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: songURL)
            audioPlayer?.delegate = self
        } catch {
            print("Audio error: \(error.localizedDescription)")
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Private
    func playPause() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Playback
    private func play() {
        audioPlayer?.play()
        delegate?.didPlay()
    }
    
    private func pause() {
        audioPlayer?.pause()
        delegate?.didPause()
    }
}

extension AudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        delegate?.didFinishPlaying()
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if let error = error {
            print("Audio player error: \(error.localizedDescription)")
        }
    }
}
