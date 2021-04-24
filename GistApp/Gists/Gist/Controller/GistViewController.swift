//
//  GistViewController.swift
//  GistApp
//
//  Created by ArjMaster on 21/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class GistViewController: UIViewController {
    
    
    var gistCaptured:GistModel!;
    var comments:[CommentsModel] = [];
    var idGist:String = ""

    //MARK: Outlets
    @IBOutlet weak var ScreenTitle: UILabel!
    @IBOutlet weak var BoxLabels: UIView!
    @IBOutlet weak var OwnerLabel: UILabel!
    @IBOutlet weak var LanguageLabel: UILabel!
    @IBOutlet weak var GistTextContent: UITextView!
    @IBOutlet weak var CloseViewButton: UIButton!
    @IBOutlet weak var ListViewComments: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()

        self.ListViewComments.dataSource = self
        self.ListViewComments.delegate = self
        
        getGistById(id: idGist) {
            self.setLabelsView()
            self.getListComments()
        }
    }
    
    //MARK: Setup Layout
    func setupLayout(){
        Utils().setColorBorderView(view: self.CloseViewButton, border: 0, radius: Int(self.CloseViewButton.bounds.height/2))
        Utils().setColorBorderView(view: self.BoxLabels, border: 0, radius: 10)
        Utils().createSpinnerView(viewControl: self, timer: 1.0, {})
    }
    
    func setLabelsView(){
        let keyFile = Array(gistCaptured.files.keys)[0]
        
        ScreenTitle.text = String(gistCaptured.files[keyFile]!.filename ?? "").uppercased()
        OwnerLabel.text = gistCaptured.owner.login
        LanguageLabel.text = String(gistCaptured.files[keyFile]!.language ?? "")
        GistTextContent.text = String((gistCaptured.files[keyFile]?.content)!)
    }
    
    //MARK: Requests
    func getListComments(){
        GistRepository().getCommentGist(gistCaptured.comments_url) { (data) in
            self.comments = data
            self.ListViewComments.reloadData()
        }
    }
    
    func getGistById(id:String, _ completion:@escaping() -> Void){
        GistRepository().getGistById(id) { (data) in
            self.gistCaptured = data
            completion()
        }
    }
    
    //MARK: Actions
    @IBAction func CloseViewButton(_ sender: Any) {
        self.gistCaptured = nil
        self.navigationController?.popViewController(animated: true)
    }
}
