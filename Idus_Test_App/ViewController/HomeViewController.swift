//
//  HomeViewController.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/04.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol {
    var viewModel:HomeViewModel { get set }
    func configure()
}

class HomeViewController : UIViewController, HomeViewControllerProtocol{
    
    var viewModel = HomeViewModel()
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {

    }
    
    func configure() {
        
    }
    
}
