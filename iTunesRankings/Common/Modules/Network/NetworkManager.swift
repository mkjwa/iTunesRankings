//
//  NetworkManager.swift
//  iTunesRankings
//
//  Created by RetinaFish on 26/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
    private var request: NSMutableURLRequest!
    private var task: URLSessionTask!
    
    private let queue = DispatchQueue(label: "requests.queue", qos: .utility)
    private let mainQueue = DispatchQueue.main
    
    // MARK:- Accessor
    
    class func shared() -> NetworkManager {
        return sharedManager
    }
    
    // MARK:- Open Methods
    
    open func request(_ urlString: String, closure: @escaping (_ reponse: [String: Any]?, _ error: Error?)->()) {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        task(request: request) { json, error in
            closure(json, error)
        }
    }

    // MARK:- Local Methods
    
    private func task(session: URLSession = URLSession.shared, request: URLRequest, handler: @escaping (_ response: [String: Any]?, _ error: Error?)->()) {
        let task = session.dataTask(with: request) { data, response, error in
            self.queue.async {
                guard error == nil else {
                    return
                }
                guard let data = data else {
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                        self.mainQueue.async {
                            handler(json, nil)
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                    self.mainQueue.async {
                        handler(nil, error)
                    }
                }
            }
        }
        
        task.resume()
    }
    
    // MARK:- Initialize
    
    private override init() {
        super.init()
    }
    
    private static var sharedManager: NetworkManager = {
        let sharedManager = NetworkManager()

        return sharedManager
    }()
}
