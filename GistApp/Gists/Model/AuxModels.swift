//
//  FileModel.swift
//  GistApp
//
//  Created by ArjMaster on 21/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

struct FileModel: Codable {
    var filename:String;
    var language:String;
    var content:String;
}

struct UserModel: Codable {
    var id:Int;
    var login:String;
    var avatar_url:String;
}
