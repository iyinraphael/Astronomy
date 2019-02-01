//
//  FetchPhotoOperation.swift
//  Astronomy
//
//  Created by Iyin Raphael on 1/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class FetchPhotoOperation: ConcurrentOperation {
    
    var dataTask: URLSessionDataTask?
    var photoReference: MarsPhotoReference
    var imageData: Data?
    
    init(photoReference: MarsPhotoReference){
        self.photoReference = photoReference
    }
    
    override func start() {
        self.state = .isExecuting
        let dataTasksmall = URLSession.shared.dataTask(with: photoReference.imageURL.usingHTTPS!) { (data, _, error) in
            if let error = error {
                NSLog("Error occured iin url \(error)")
                return
            }
            guard let data = data else {return}
            self.imageData = data
            self.state = .isFinished
        }
        dataTask = dataTasksmall
        dataTask?.resume()
    }
    
    override func cancel() {
        dataTask?.cancel()
    }
    
    
}
