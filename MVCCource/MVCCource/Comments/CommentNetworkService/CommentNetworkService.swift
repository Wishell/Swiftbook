//
//  CommentNetworkService.swift
//  MVCCource
//
//  Created by Wishell on 09.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

class CommentNetworkService{
    private init() {}
    
    static func getComments(complition: @escaping (GetCommentResponse)->()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else {return}
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetCommentResponse(json: json)
                complition(response)
            }catch {
                
            }
        }
    }
}
