//
//  ViewController.swift
//  avengine
//
//  Created by Balázs Kiss on 2022. 01. 06..
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var allowVoiceProcessing = false

    override func viewDidLoad() {
        super.viewDidLoad()
        try! AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
        try! AVAudioSession.sharedInstance().setActive(true, options: [.notifyOthersOnDeactivation])
    }

    @IBAction func tappedSwitch(sender: UISwitch) {
        allowVoiceProcessing = sender.isOn
    }

    @IBAction func tappedButton() {
        testAudioEngine()
    }

    func testAudioEngine() {
        let audioEngine = AVAudioEngine()
        let shouldUseVoiceProcessing: Bool = allowVoiceProcessing && AVAudioSession.sharedInstance().currentRoute.outputs.first?.portType == .builtInSpeaker
        try! audioEngine.inputNode.setVoiceProcessingEnabled(shouldUseVoiceProcessing)
        try! audioEngine.outputNode.setVoiceProcessingEnabled(shouldUseVoiceProcessing)
        let inputNodeInputSampleRate: Double = audioEngine.inputNode.inputFormat(forBus: 0).sampleRate
        let inputNodeOutputSampleRate: Double = audioEngine.inputNode.outputFormat(forBus: 0).sampleRate
        let outputNodeInputSampleRate: Double = audioEngine.outputNode.inputFormat(forBus: 0).sampleRate
        let outputNodeOutputSampleRate: Double = audioEngine.outputNode.outputFormat(forBus: 0).sampleRate
        print("---")
        print("route: \(AVAudioSession.sharedInstance().currentRoute.outputs.first?.portType.rawValue ?? "nil")")
        print("voiceProcessing: \(shouldUseVoiceProcessing)")
        print("inputNodeInputSampleRate: \(inputNodeInputSampleRate)")
        print("inputNodeOutputSampleRate: \(inputNodeOutputSampleRate)")
        print("outputNodeInputSampleRate: \(outputNodeInputSampleRate)")
        print("outputNodeOutputSampleRate: \(outputNodeOutputSampleRate)")
    }

}

