//
//  DetailViewModel.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/09.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate {
    func LoadingStart()
    func RealodDataFinished(state : ServiceResponse)
}

protocol DetailViewModelProtocol {
    
    var title:String { get }
    
    var model : [HomeModel] { get set }
    
    func initDataload()
    
    func getModelCount() -> Int
    
    func setDelegate(homeViewModelDelegate : HomeViewModelDelegate);
    
}

class DetailViewModel : DetailViewModelProtocol{
    
    public var title:String {
        return "제품 목록"
    }
    
    var model = [HomeModel]()
    
    func initDataload() {
        
    }
    
    func getModelCount() -> Int {
        return self.model.count
    }
    
    func setDelegate(homeViewModelDelegate: HomeViewModelDelegate) {
        
    }
    
}
