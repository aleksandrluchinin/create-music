//
//  ViewController.swift
//  create music
//
//  Created by Aleksandr  on 28.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let newViewController = OscilatorViewController()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Мой Музыкальный Композитор"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        let newTrackButton = UIButton(type: .system)
        newTrackButton.setTitle("Создать новый трек", for: .normal)
        newTrackButton.addTarget(self, action: #selector(createNewTrack), for: .touchUpInside)
        view.addSubview(newTrackButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        newTrackButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            newTrackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newTrackButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            newTrackButton.widthAnchor.constraint(equalToConstant: 200),
            newTrackButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
    @objc func createNewTrack() {
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .coverVertical

       
        self.present(newViewController, animated: true, completion: nil)
    }
}
