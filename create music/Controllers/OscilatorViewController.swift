//
//  OscilatorViewController.swift
//  create music
//
//  Created by Aleksandr  on 28.03.2023.
//

import UIKit
import AVFoundation

class OscilatorViewController: UIViewController {
    
    var audioEngine = AVAudioEngine()
    var audioPlayerNode = AVAudioPlayerNode()
    var audioFile: AVAudioFile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // создаем аудио-файл для воспроизведения
        guard let audioFilePath = Bundle.main.path(forResource: "music", ofType: "mp3") else {
            print("Не удалось найти файл музыки")
            return
        }
        
        do {
            audioFile = try AVAudioFile(forReading: URL(fileURLWithPath: audioFilePath))
        } catch {
            print("Не удалось загрузить аудио-файл")
            return
        }
        
        // подключаем аудио-плеер к audioEngine
        audioEngine.attach(audioPlayerNode)
        audioEngine.connect(audioPlayerNode, to: audioEngine.mainMixerNode, format: audioFile?.processingFormat)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // начинаем воспроизведение звука при касании экрана
        guard let audioFile = audioFile else {
            print("Аудио-файл не загружен")
            return
        }
        
        audioPlayerNode.scheduleFile(audioFile, at: nil)
        do {
            try audioEngine.start()
        } catch {
            print("Не удалось запустить audioEngine")
            return
        }
        
        audioPlayerNode.play()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // останавливаем воспроизведение звука при отпускании экрана
        audioPlayerNode.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // останавливаем воспроизведение звука при отмене касания экрана
        audioPlayerNode.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
}
