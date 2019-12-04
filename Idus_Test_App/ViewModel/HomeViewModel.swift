//
//  HomeViewModel.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/04.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    
    var title:String { get }
    
    var model : [HomeModel] { get set }
    
    mutating func refreshData()
    
}

public class HomeViewModel : HomeViewModelProtocol {
    
    var model = [HomeModel]()
    
    public var title:String {
        return "제품 목록"
    }
    
    func refreshData() {
        
    }
    
}
