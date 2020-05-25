//
//  ViewController.swift
//  ConstraintsMonitor
//
//  Created by FranDepascuali on 05/25/2020.
//  Copyright (c) 2020 FranDepascuali. All rights reserved.
//

import UIKit

class MyView: UIView {
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = MyView()
        
        let redView = UIView()
        let greenView = UIView()
        
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        
        [greenView, redView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        let identifier = redView.leftAnchor.constraint(equalTo: self.view.rightAnchor)
        
        identifier.identifier = "Constraint Identifier"
        
        NSLayoutConstraint.activate([
//            identifier,
            redView.topAnchor.constraint(equalTo: self.view.topAnchor),
            redView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            redView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            redView.heightAnchor.constraint(equalToConstant: 200),
            
            greenView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            greenView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            greenView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            greenView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            greenView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2)
        ])
        
        
//        self.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        self.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

