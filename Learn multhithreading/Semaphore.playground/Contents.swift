//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution=true
class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

let queue = DispatchQueue(label: "label", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 2)

//queue.async {
//    semaphore.wait()
//    sleep(3)
//    print("method1")
//    semaphore.signal()
//    print("end 1")
//}
//
//queue.async {
//    semaphore.wait()
//    sleep(3)
//    print("method2")
//    semaphore.signal()
//    print("end 2")
//}
//
//queue.async {
//    semaphore.wait()
//    print("start 3")
//    sleep(3)
//    print("method3")
//    semaphore.signal()
//}

//let sem = DispatchSemaphore(value: 2)
//
//DispatchQueue.concurrentPerform(iterations: 10) { (id: Int) in
//    sem.wait(timeout: DispatchTime.distantFuture)
//    sleep(2)
//    print("block", String(id))
//
//    sem.signal()
//}

class SemaphorTest {
    let semaphore = DispatchSemaphore(value: 1)
    var array = [Int]()
    
    func methodWork(_ id: Int) {
        semaphore.wait()
        array.append(id)
        print(array.count)
        
        Thread.sleep(forTimeInterval: 2)
        semaphore.signal()
    }
    
    func startAllThread() {
        DispatchQueue.global().async {
            self.methodWork(111)
        }
        
        DispatchQueue.global().async {
            self.methodWork(222)
        }
        
        DispatchQueue.global().async {
            self.methodWork(333)
        }
        
        DispatchQueue.global().async {
            self.methodWork(444)
        }
    }
}

let st = SemaphorTest()
st.startAllThread()
