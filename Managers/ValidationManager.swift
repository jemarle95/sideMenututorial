//
//  ValidationManager.swift
//  sideMenututorial
//
//  Created by The App Experts on 18/07/2019.
//  Copyright © 2019 Jemarl Ebanks. All rights reserved.
//

import Foundation


struct RequestHelper {
  static let path = Bundle.main.path(forResource: "Configure", ofType: "plist")
  static let config = NSDictionary(contentsOfFile: path!)
  private static let baseURLString = config!["serverUrl"] as! String
  
  static func createRequest(_ path: String,
                            _ parameters: [String: String],
                            completionHandler: @escaping (_ result: Data) -> VerifyResult) {
    
    let urlPath = "\(baseURLString)/\(path)"
    
    // Not working because finding Nil Here - changed safely unwrapped
    guard var components = URLComponents(string: urlPath) else { return }
    
    var queryItems = [URLQueryItem]()
    
    for (key, value) in parameters {
      let item = URLQueryItem(name: key, value: value)
      queryItems.append(item)
    }
    
    components.queryItems = queryItems
    
    // Changed to safely unwrap
    guard let url = components.url else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    let session: URLSession = {
      let config = URLSessionConfiguration.default
      return URLSession(configuration: config)
    }()
    
    let task = session.dataTask(with: request) {
      (data, response, error) -> Void in
      if let jsonData = data {
        let result = completionHandler(jsonData)
        print(result)
      } else {
        // error, no data returned
      }
    }
    task.resume()
  }
}
