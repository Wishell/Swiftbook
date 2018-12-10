//
//  GetCommentResponse.swift
//  MVCCource
//
//  Created by Wishell on 10.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

enum ResponseError : Error {
    case NoConnection
}

struct GetCommentResponse {
    let comments: [Comment]
    
    init(json: Any) throws {
        guard let array = json as? [[String:AnyObject]] else{throw ResponseError.NoConnection}
        var comments = [Comment]()
        for dictionary in array {
            guard let comment = Comment(dict: dictionary) else {continue}
            comments.append(comment)
        }
        self.comments = comments
    }
    
}
