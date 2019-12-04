//
//  LoadingViewController.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/04.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit

class LoadingViewController : UIViewController{
    
    override func viewDidLoad() {
        perform(#selector(ToNext), with: nil, afterDelay: 3)
    }
    
    @objc func ToNext(){
        performSegue(withIdentifier: "next", sender: self)
    }
    
}
