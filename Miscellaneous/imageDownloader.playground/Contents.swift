
import Foundation
input: A, B

  A
-----
  B
  
----------------

input: C, D

  C
-----
  D
-----
  A
-----
  B
  
-----------------

input: A, E

  A
-----
  E
-----
  C
-----
  D
-----
  B
  
  class Feed {
    var id: Int
  }
var curFeeds: [Feed] = []
// A , B
// A
// B,D
func onReceived(feeds: [Feed]) {
  var newArray = feeds // [B,D]
  
  for feed in feeds {
    if let firstIndexOfFeed = curFeeds.firstIndex(where: { $0.id == feed.id}) {
      curFeeds.remove(at:firstIndexOfFeed)
    }
  }
  newArray.append(contentsOf: curFeeds)
  curFeeds = newArray
}

[URL : DATA]

class ImageDownloader: NSObject {
    static let shared = ImageDownloader()
    private let imageCache: NSCache<NSString, UIImage>
    private var session: URLSession!
    private var operations: [OperationsModel] = []
    private var downloadQueue = OperationQueue()
    private override init() {
        self.session = URLSession.shared
        self.imageCache = NSCache()
    }
    public func download(photo: Photo, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        let operation = BlockOperation.init {
            if let cachedImage = self.imageCache.object(forKey: photo.thumbnailUrlStr as NSString) {
                completion(cachedImage, nil)
            } else {
                guard let url = URL.init(string: photo.thumbnailUrlStr) else {
                    completion(nil, nil)
                    return
                }
                let task = self.session.dataTask(with: url, completionHandler: { (data, _, error) in
                    if let error = error {
                        completion(nil, error)
                    } else if let data = data, let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        completion(image, nil)
                    } else {
                        completion(nil, nil)
                    }
                })
                task.resume()
            }
        }
        downloadQueue.addOperation(operation)
        let photoOp = OperationsModel.init(photo: photo, operation: operation)
        operations.append(photoOp)
        operation.completionBlock = {
            OperationQueue.main.addOperation {
                if let index = self.operations.firstIndex(where: {$0.photo == photo}) {
                    self.operations.remove(at: index)
                }
            }
        }
    }
    public func downloadLarge(photo: Photo, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        if let cachedImage = self.imageCache.object(forKey: photo.largeImageUrlStr as NSString) {
            completion(cachedImage, nil)
        } else {
            guard let url = URL.init(string: photo.largeImageUrlStr) else {
                completion(nil, nil)
                return
            }
            let task = self.session.dataTask(with: url, completionHandler: { (data, _, error) in
                if let error = error {
                    completion(nil, error)
                } else if let data = data, let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image, nil)
                } else {
                    completion(nil, nil)
                }
            })
            task.resume()
        }
    }
    public func raiseDownloadPriority(forPhoto photo: Photo) {
        if let downloadOpIndex = operations.firstIndex(where: {$0 === photo}) {
            operations[downloadOpIndex].operation.queuePriority = .veryHigh
        }
    }
    public func reduceDownloadPriority(forPhoto photo: Photo) {
        if let downloadOpIndex = operations.firstIndex(where: {$0 === photo}) {
            operations[downloadOpIndex].operation.queuePriority = .normal
        }
    }
    public func cancalAllDownloads() {
        downloadQueue.cancelAllOperations()
    }
    public func pauseAllDownloads() {
        downloadQueue.isSuspended = true
    }
    public func resumeAllDownloads() {
        downloadQueue.isSuspended = false
    }
}

{
  "message": "kjcnjdhfbv"
  "status": 0
}



