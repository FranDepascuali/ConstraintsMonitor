//
//  ViewController.swift
//  ConstraintsMonitor
//
//  Created by FranDepascuali on 05/25/2020.
//  Copyright (c) 2020 FranDepascuali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = UIView()
        
//        let redView = UIView()
//        let greenView = UIView()
//        
//        redView.backgroundColor = .red
//        greenView.backgroundColor = .green
//        
//        [greenView, redView].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview($0)
//        }
//        
//        let asdas = redView.leftAnchor.constraint(equalTo: self.view.rightAnchor)
//        
//        asdas.identifier = "Some constraint"
//        
//        NSLayoutConstraint.activate([
////            asdas,
//            redView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            redView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 23),
//            redView.heightAnchor.constraint(equalToConstant: 40),
//            redView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
//            redView.topAnchor.constraint(equalTo: self.view.topAnchor),
//            redView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
//            
//            redView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            redView.heightAnchor.constraint(equalToConstant: 200),
//            
//            greenView.topAnchor.constraint(equalTo: redView.bottomAnchor),
//            greenView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
//            greenView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            greenView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
//        ])
        
        
//        self.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        self.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

