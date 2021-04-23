//
//  GistModel.swift
//  GistApp
//
//  Created by ArjMaster on 20/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

struct GistModel: Codable {
    let id:String;
    
    let files:[String:FileModel];
    let created_at:String;
    let updated_at:String;
    let comments:Int;
    let comments_url:String;
    let owner:UserModel
}

struct AllGistModel: Codable {
    let id:String;
    let files:[String:Files];
    let description:String?;
    let comments_url:String;
    let owner:UserModel
}
