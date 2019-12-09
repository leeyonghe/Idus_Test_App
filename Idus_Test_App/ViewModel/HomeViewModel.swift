//
//  HomeViewModel.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/04.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeViewModelDelegate {
    func RealodDataFinished()
}

enum ServiceResponse {
    case success([String: Any])
    case failure
}

protocol HomeViewModelProtocol {
    
    var title:String { get }
    
    var model : [HomeModel] { get set }
    
    func initDataload()
    
    func getModelCount() -> Int
    
    func setDelegate(homeViewModelDelegate : HomeViewModelDelegate);
    
}

public class HomeViewModel : HomeViewModelProtocol {
    
    func initDataload() {
        
        Alamofire.request(AppConstants.base_url,
                          method: .get,
                          parameters: ["include_docs": "true"])
        .validate()
        .responseJSON { response in
          guard response.result.isSuccess else {
            print("Error while fetching remote rooms: \(String(describing:response.result.error))")
//            completion(nil)
            return
          }

          guard let value = response.result.value as? [String: Any],
            let rows = value["rows"] as? [[String: Any]] else {
              print("Malformed data received from fetchAllRooms service")
//              completion(nil)
              return
          }
          
          self.model = rows.compactMap { roomDict in return HomeModel(jsonData: roomDict) }
//          completion(rooms)
        }
        
    }
    
    init() {
        self.initDataload()
    }
    
    var homeViewModelDelegate : HomeViewModelDelegate?
    
    var model = [HomeModel]()
    
    func setDelegate(homeViewModelDelegate : HomeViewModelDelegate){
        self.homeViewModelDelegate = homeViewModelDelegate
    }
    
    func getModelCount() -> Int {
        return self.model.count
    }
    
    public var title:String {
        return "제품 목록"
    }
    
}
