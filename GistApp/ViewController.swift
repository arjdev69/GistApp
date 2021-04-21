//
//  ViewController.swift
//  GistApp
//
//  Created by ArjMaster on 20/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var labelTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        GistRepository().getGistById("95fcf71eb72f2ea1e3836d192c788ebc") { (data) in
            
            let first = Array(data.files.keys)[0]
            
         //   self.labelTest.text = String(data.files[first]!.content)
            
            
            print(first)
            
        }
    }


}

