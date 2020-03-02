import UIKit
import PlaygroundSupport

var str = "Hello, playground"

var queue = DispatchQueue.init(label: "s")
queue.async {
    print(1)
    DispatchQueue.main.sync{
        print(3)
    queue.async {
        print(2)
    }
    }
}
