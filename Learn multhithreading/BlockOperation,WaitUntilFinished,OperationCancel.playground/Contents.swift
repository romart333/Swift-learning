//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let opQueue = OperationQueue()

class OperationCancelTest: Operation {
    override func main() {
        if isCancelled {
            print(isCancelled)
            return
        }
        print("test 1")
        sleep(1)
        
        if isCancelled {
            print(isCancelled)
            return
        }
        print("test 2")
    }
}


func cancelOperationMethod() {
    let oct = OperationCancelTest()
    opQueue.addOperation(oct)
    // Второй принт уже не сработает
    oct.cancel()
}
//cancelOperationMethod()












class WaitOperationTest {
    let operQueue = OperationQueue()
    
    func test() {
        operQueue.addOperation {
            sleep(1)
            print("test1")
        }
        operQueue.addOperation {
            sleep(2)
            print("test2")
        }
        // работает как барьер у GCD
        operQueue.waitUntilAllOperationsAreFinished()
        operQueue.addOperation {
            print("test3")
        }
        operQueue.addOperation {
            print("test4")
        }
    }
}

let wot = WaitOperationTest()
//wot.test()


class WaitOperationTest2 {
    let operQueue = OperationQueue()
    
    func test() {
        let op1 = BlockOperation {
            sleep(1)
            print("test1")
        }
        
        let op2 = BlockOperation {
            sleep(2)
            print("test2")
        }
        // второй параметр работает как барьер
        operQueue.addOperations([op1, op2], waitUntilFinished: true)
        print("finish test")
    }
}
let wot2 = WaitOperationTest2()
//wot2.test()

class CompletionBlockTest {
    let opQueue = OperationQueue()
    
    func test() {
        let op1 = BlockOperation {
            print(Thread.current)
            print("Test compl block")
        }
        op1.completionBlock = {
            print("compl block finish")
        }
        opQueue.addOperation(op1)
    }
}

let cbt = CompletionBlockTest()
cbt.test()
