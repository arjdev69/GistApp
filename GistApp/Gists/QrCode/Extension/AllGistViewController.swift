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
    
    func getGistById(id:String){
        GistRepository().getGistById(id) { (data) in
            self.navigateControllerView(dataGist: data)
        }
    }
    
    //MARK: Navigation
    func navigateControllerView(dataGist:GistModel){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GistView") as! GistViewController
        
        controller.gistCaptured = dataGist
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
