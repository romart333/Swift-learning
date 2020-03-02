//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        view.backgroundColor = .yellow

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

//var array = [Int]()
//for i in 1...9 {
//    array.append(i)
//}
//
//DispatchQueue.concurrentPerform(iterations: array.count) { (index) in
//    print(index)
//}

class SafeArray<T> {
    var array = [T]()
    let queue = DispatchQueue(label: "label",
                              attributes: .concurrent)
    
    func append(_ value: T) {
        
        queue.async(flags: .barrier) {
            self.array.append(value)
        }
    }
    
    var valueArray: [T] {
        var result = [T]()
        queue.sync {
            result = self.array
        }
        return result
    }
}

// Благодаря барьеру все грузится по порядку
let sa = SafeArray<Int>()
DispatchQueue.concurrentPerform(iterations: 10) { (index) in
    sa.append(index)
}

print(sa.valueArray.count)
print(sa.valueArray)







