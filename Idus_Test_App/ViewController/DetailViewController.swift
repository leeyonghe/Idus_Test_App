//
//  DetailViewController.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/09.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit
import SVGKit

class DetailViewController : UIViewController {
    
    @IBOutlet var cancelBtn: UIButton!
    
    var id : Int = 0
    
//    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        
        let cancel: SVGKImage = SVGKImage(named: "cancel_24px")
        cancelBtn.setBackgroundImage(cancel.uiImage, for: UIControl.State.normal)
    }
    
}
