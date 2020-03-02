//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()

class DispatchWorkItem1 {
    let queue = DispatchQueue(label: "DWI1", attributes: .concurrent)
    
    func create() {
        let workItem = DispatchWorkItem {
            print(Thread.current)
            print("Start task")
        }
        
        workItem.notify(queue: .main) {
            print(Thread.current)
            print("Task finished")
        }
        
        queue.async(execute: workItem)
    }
}
//
//let dwi1 = DispatchWorkItem1()
//dwi1.create()

class DispatchWorkItem2 {
    let queue = DispatchQueue(label: "DWI2")
    
    func create() {
        
        queue.async {
            sleep(1)
            print("work 1")
        }
        
        queue.async {
            sleep(1)
            print("work 2")
        }
        
        let workItem = DispatchWorkItem {
            print(Thread.current)
            print("Start work item 3" )
        }
        
        queue.async(execute: workItem)
        // Главное отличие GCD от OperationQueueu в том, что GCD умеет стопать только те задачи, которые еще не стартанули!
        workItem.cancel()
    }
}

//let dwi2 = DispatchWorkItem2()
//dwi2.create()

let imageURL = URL(string: "https://cs8.pikabu.ru/post_img/big/2016/02/04/7/145458292112119207.jpg")

var view = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))
var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))
view.addSubview(image)

image.backgroundColor = .yellow
image.contentMode = .scaleAspectFit


PlaygroundPage.current.liveView = view


//Clasic
func fetchImage() {
    let queue = DispatchQueue.global(qos: .utility)
    
    queue.async {
        if let data = try? Data(contentsOf: imageURL!) {
            DispatchQueue.main.async {
                image.image = UIImage(data: data)
            }
        }
    }
}
//fetchImage()

// DWI
func fetchImage2() {
    var data: Data?
    let queue = DispatchQueue.global(qos: .utility)
    
    let workItem = DispatchWorkItem(qos: .userInteractive) {
        data = try? Data(contentsOf: imageURL!)
        print(Thread.current)
    }
    
    queue.async(execute: workItem)
    workItem.notify(queue: .main) {
        if let imageData = data {
            image.image = UIImage(data: imageData)
        }
    }
}
//fetchImage2()





