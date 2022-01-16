//
//  StartViewController.swift
//  DocScanner
//
//  Created by Раис Аглиуллов on 16.01.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.setTitle("Soso", for: .highlighted)
        self.view.addSubview(self.button)
        NSLayoutConstraint.activate([
            self.button.heightAnchor.constraint(equalToConstant: 50),
            self.button.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor),
            self.view.layoutMarginsGuide.rightAnchor.constraint(equalTo: self.button.rightAnchor),
            self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        self.button.backgroundColor = UIColor.green
        self.button.setTitle("Jmi", for: .normal)
        self.view.backgroundColor = UIColor.red
        self.button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        print("Ja")
    }
}
