//
//  GistQrCodeViewController.swift
//  GistApp
//
//  Created by ArjMaster on 21/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import AVFoundation
import UIKit

class GistQrCodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    @IBOutlet weak var BoxImage: UIView!
    @IBOutlet weak var ScanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    //MARK: Setup Layout
    func setupLayout(){
        Utils().setColorBorderView(view: self.BoxImage, border: 2, radius: 10, #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        Utils().setColorBorderView(view: self.ScanButton, border: 0, radius: Int(self.ScanButton.bounds.height/2))
    }
    
    //MARK: NavigationGist
    func navigateControllerView(id:String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GistView") as! GistViewController
        
        controller.idGist = id
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: Requests
    func getGistById(){
        self.navigateControllerView(id: "325d250596e923f6b6028576fcb684da")
    }
    
    //MARK: Actions
    @IBAction func ScanQrCode(_ sender: Any) {
        if !startCapture() {
            getGistById()
        }
    }
}
