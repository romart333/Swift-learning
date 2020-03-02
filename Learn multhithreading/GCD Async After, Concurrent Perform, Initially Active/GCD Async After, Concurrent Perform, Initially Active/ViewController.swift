//
//  ViewController.swift
//  GCD Async After, Concurrent Perform, Initially Active
//
//  Created by user167101 on 2/28/20.
//  Copyright © 2020 user167101. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        afterBlock(seconds: 2) {
            print("hello")
            self.showAlert()
            //print(Thread.current)
        }
      
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "hello", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global(), completion: @escaping () -> ()) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            completion()
        }
    }
    
    
    

}

