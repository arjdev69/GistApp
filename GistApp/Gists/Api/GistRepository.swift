//
//  GistRepository.swift
//  GistApp
//
//  Created by ArjMaster on 20/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class GistRepository:NSObject {
    
    func getGistById(_ id:String, completion:@escaping(_ data:GistModel) -> Void){
        GistApi().getGistById(id) { (data) in
            completion(data)
        }
    }
    
    func getAllGists(completion:@escaping(_ data:[AllGistModel]) -> Void){
        GistApi().getAllGists() { (data) in
            completion(data)
        }
    }
    
    func getCommentGist(_ url:String, completion:@escaping(_ data:[CommentsModel]) -> Void){
        GistApi().getCommentGist(url) { (data) in
            completion(data)
        }
    }
    
}
