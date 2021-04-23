//
//  AllGistViewController.swift
//  GistApp
//
//  Created by ArjMaster on 23/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class AllGistViewController: UIViewController {
    
    var allGists:[AllGistModel] = []

    @IBOutlet weak var GistsListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllGists()
        
        GistsListView.dataSource = self
        GistsListView.delegate = self
    }
    
    //MARK: Reuqests
    func getAllGists(){
        GistRepository().getAllGists { (data) in
            self.allGists = data
            self.GistsListView.reloadData()
        }
    }
}
