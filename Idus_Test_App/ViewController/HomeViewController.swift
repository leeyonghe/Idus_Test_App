//
//  HomeViewController.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/04.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    
    var viewModel = HomeViewModel()
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        initView()
        viewModel.homeViewModelDelegate = self
    }
    
    func initView() {
        
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getModelCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.viewModel.model[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! HomeViewCell
        
        return cell
        
    }
    
}

extension HomeViewController : HomeViewModelDelegate{
    
    func RealodDataFinished() {
        self.table.reloadData()
    }
    
}
