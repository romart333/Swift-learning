//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


class DispatchGroupTest1 {
    let queue = DispatchQueue.init(label: "first")
    
    private let groupRed = DispatchGroup()
    func load() {
        queue.async(group: groupRed) {
            sleep(2)
            print("1")
        }
        
        queue.async(group: groupRed) {
            sleep(1)
            print("2")
        }
        
        groupRed.notify(queue: .main) {
            print("Red group finish")
        }
    }
}

//let dgt1 = DispatchGroupTest1()
//dgt1.load()


class DispatchGroupTest2 {
    
    private let queue = DispatchQueue.init(label: "first", attributes: .concurrent)
    
    private let groupBlack = DispatchGroup()
    
    func load() {
        // Добавляет  блок кода в группу
        groupBlack.enter()
        queue.async(group: groupBlack) {
            sleep(2)
            print("1")
            // Выход из блока. Обязателен после входа!!
            self.groupBlack.leave()
        }
        
        groupBlack.enter()
        queue.async(group: groupBlack) {
            sleep(1)
            print("2")
            self.groupBlack.leave()
        }
        
        // Ждет выыполнения всей группы
        groupBlack.wait()
        print("Black group finish")
    }
}

//let dgt2 = DispatchGroupTest2()
//dgt2.load()


let imageURLs =
    [
     "https://images.unsplash.com/photo-1531923981709-9fd5eb67572c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
     "https://images.unsplash.com/photo-1522865080725-2a9ea1fcb94e?ixlib=rb-1.2.1&w=1000&q=80",
     "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRfbLEvuZ5PyuO_BvrqrpRz6Wa_97OD4uxpHkuYM1N3a9abmvZJ"]

class LoadedImages: UIView {
    var ivs = [UIImageView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ivs.append(UIImageView(frame: CGRect(x: 190, y: 0, width: 100, height: 100)))
         ivs.append(UIImageView(frame: CGRect(x: 190, y: 60, width: 100, height: 100)))
         ivs.append(UIImageView(frame: CGRect(x: 380, y: 0, width: 100, height: 100)))
//         ivs.append(UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100)))
        backgroundColor = .red
        for i in 0..<ivs.count {
            ivs[i].contentMode = .scaleAspectFit
            self.addSubview(ivs[i])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder not impimented")
    }
}

var view = LoadedImages(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
var images = [UIImage]()
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = view

func asyncLoadImage(imageURL: URL,
                    runQueue: DispatchQueue,
                    completionQueue: DispatchQueue,
                    completion: @escaping (UIImage?, Error?) -> ()) {
    runQueue.async {
        do {
            let data = try Data(contentsOf: imageURL)
            print("before queue url \(imageURL)")
            completionQueue.async {
                print("in queue (imageURL)..")
                completion(UIImage(data: data), nil) }
        } catch let error {
            print("error")
            completionQueue.async { completion(nil,error) }
        }
    }
}

func asyncGroup() {
    let group = DispatchGroup()
    let imageCount = 3
    for i in 0..<imageCount {
        group.enter()
        print("Enter group")
        asyncLoadImage(imageURL: URL(string: imageURLs[i])!,
                       runQueue: .global(),
                       completionQueue: .main) { [unowned group] (result, error) in
                        guard let result = result else {
                            print(error)
                            print("error")
                            group.leave()
                            return
                        }
                        
                        print("load \(imageURLs[i])")
                        images.append(result)
                        print("leave group")
                        group.leave()
        }
    }
    
    group.notify(queue: .main) {
        for i in 0..<imageCount {
            print("load imageto view")
            view.ivs[i].image = images[i]
        }
    }
}

//asyncGroup()

func asyncUrlSession () {
    for i in 0..<3 {
        let url = URL(string: imageURLs[i])
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async{
                view.ivs[i].image = UIImage(data: data!)
            }
        }
        
        task.resume()
    }
}
// Хреново группы работают. Картинки не появляются. У групп картинки должны появиться одновременно. У URL session -  в рандомном порядке
asyncUrlSession()
//asyncGroup()
