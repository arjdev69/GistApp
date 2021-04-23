//
//  CommentTableViewCell.swift
//  GistApp
//
//  Created by ArjMaster on 22/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarUser: UIImageView!
    @IBOutlet weak var textViewComment: UITextView!
    @IBOutlet weak var authorName: UILabel!
    
    
    func setViewCell(_ data:CommentsModel){
        loadImage(url: data.user.avatar_url)
        textViewComment.text = data.body
        authorName.text = data.user.login
        
        avatarUser.layer.cornerRadius = avatarUser.bounds.width/2
        avatarUser.layer.masksToBounds = true
    }
    
    func loadImage(url: String) {
        let imageUrl = URL(string: url)!
        let imageData = try! Data(contentsOf: imageUrl)
        avatarUser.image = UIImage(data: imageData)
    }
    
}


extension UIImageView {
}
