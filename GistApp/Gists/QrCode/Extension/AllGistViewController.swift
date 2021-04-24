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
        
        Utils().createSpinnerView(viewControl: self, timer: 1.5) {
            print("done")
        }
    }
    
    //MARK: Requests
    func getAllGists(){
        GistRepository().getAllGists(count:10) { (data) in
            self.allGists = data
            self.GistsListView.reloadData()
        }
    }
    
    //MARK: Navigation
    func navigateControllerView(idGist:String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GistView") as! GistViewController
        
        controller.idGist = idGist
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
