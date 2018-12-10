//
//  NetworkService.swift
//  MVCCource
//
//  Created by Wishell on 09.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

class NetworkService {
    private init() {}
        static let shared = NetworkService()
    
    public func getData (url: URL, complition: @escaping (Any)->()) {
        let session =  URLSession.shared
        session.dataTask(with: url){(data,response,error) in
            guard let data = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    complition(json)
                }
            }catch{
                print(error)
            }
        }.resume()
    }

}
