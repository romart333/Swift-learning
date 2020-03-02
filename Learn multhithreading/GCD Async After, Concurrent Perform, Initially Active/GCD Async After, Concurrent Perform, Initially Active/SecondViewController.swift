//
//  SecondViewController.swift
//  GCD Async After, Concurrent Perform, Initially Active
//
//  Created by user167101 on 2/28/20.
//  Copyright © 2020 user167101. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//            // Запускает iterations раз замыкание.
//            // Если НЕ указать очередь - будет зайдествовать мэйн поток
//            DispatchQueue.concurrentPerform(iterations: 200000) {
//                print("\($0) times")
//            }
//        }
        
        
        
        myInactiveQueue()
    }
    
    func myInactiveQueue() {
        let inactiveQueue = DispatchQueue(label: "inactive queue", attributes: [.concurrent, .initiallyInactive])
        inactiveQueue.async {
            print("Done")
        }
        
        print("not yet start...")
        inactiveQueue.activate()
        inactiveQueue.activate()
        print("activate!")
        inactiveQueue.suspend()
        print("queu in pause!")
        inactiveQueue.resume()
        print("queue resume!")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
