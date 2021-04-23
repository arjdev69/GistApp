//
//  AllGistsViewCell.swift
//  GistApp
//
//  Created by ArjMaster on 23/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class AllGistsViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var fileName: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
    func setViewCell(_ data:AllGistModel){
        let keyFile = Array(data.files.keys)[0]

        Utils().loadImage(url: data.owner.avatar_url, image: avatarImage)
        
        authorName.text = data.owner.login
        fileName.text = data.files[keyFile]?.filename
        descriptionLabel.text = data.description
        
        
        avatarImage.layer.cornerRadius = avatarImage.bounds.width/2
        avatarImage.layer.masksToBounds = true
    }
    
    
    
}
