//
//  CommentsModel.swift
//  GistApp
//
//  Created by ArjMaster on 22/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import Foundation

struct CommentsModel: Codable {
    var id:Int;
    var user:UserModel;
    var body:String;
}
