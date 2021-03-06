//
//  QrCodeApi.swift
//  GistApp
//
//  Created by ArjMaster on 20/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

import Alamofire

class GistApi:NSObject {
    
    // MARK: - attributes
    lazy var urlService:String = {
        guard let url = Api().getUrlService() else { return "" }
        
        return url
    }()
    
    func getGistById(_ id:String, completion:@escaping(_ data:GistModel) -> Void){
        guard let url = URL(string: urlService + "\(id)") else {return}
        
        let request = AF.request(url)
        
        request.responseDecodable(of: GistModel.self) { (response) in
            guard let gist = response.value else { print(response); return }
            completion(gist)
        }
    }
    
    func getAllGists(completion:@escaping(_ data:[AllGistModel]) -> Void){
        guard let url = URL(string: urlService + "public") else {return}
        
        let request = AF.request(url)
        
        request.responseDecodable(of: [AllGistModel].self) { (response) in
            guard let gist = response.value else { print(response); return }
            completion(gist)
        }
    }
    
    func getCommentGist(_ url:String, completion:@escaping(_ data:[CommentsModel]) -> Void){
        guard let url = URL(string: url) else {return}
    
        let request = AF.request(url)
        
        request.responseDecodable(of: [CommentsModel].self) { (response) in
            guard let comments = response.value else { print(response); return }
            completion(comments)
        }
    }
}
