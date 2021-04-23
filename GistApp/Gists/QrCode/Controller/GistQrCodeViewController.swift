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
        Utils().setColorBorderView(view: self.BoxImage, border: 2, radius: 10, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        Utils().setColorBorderView(view: self.ScanButton, border: 0, radius: Int(self.ScanButton.bounds.height/2))
    }
    
    //MARK: NavigationGist
    func navigateControllerView(dataGist:GistModel){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GistView") as! GistViewController
        
        controller.gistCaptured = dataGist
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: Requests
    func getGistById(){
        GistRepository().getGistById("325d250596e923f6b6028576fcb684da") { (data) in
            self.navigateControllerView(dataGist: data)
        }
    }
    
    //MARK: Actions
    @IBAction func ScanQrCode(_ sender: Any) {
        if !startCapture() {
            getGistById()
        }
    }
}
