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
    func LoadingStart()
    func RealodDataFinished(state : ServiceResponse)
}

enum ServiceResponse {
    case success
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
        Network("\(AppConstants.base_url)products")
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
    
    func Network(_ url : String){
        self.homeViewModelDelegate?.LoadingStart()
        Alamofire.request(url,
                          method: .get,
                          parameters: ["page": 1])
                .validate()
                .responseJSON { response in
                 
                    guard response.result.isSuccess else {
                        print("Error while fetching remote : \(String(describing:response.result.error))")
                        self.homeViewModelDelegate!.RealodDataFinished(state: ServiceResponse.failure)
                        return
                    }

                    guard let value = response.result.value as? [String: Any],
                        let rows = value["body"] as? [[String: Any]] else {
                        print("Malformed data received from service")
                        self.homeViewModelDelegate!.RealodDataFinished(state: ServiceResponse.failure)
                        return
                    }
                  
                    self.model = rows.compactMap { roomDict in return HomeModel(jsonData: roomDict) }
                    
                    NSLog(">>>>>>>>>>>>>>>>>>> model : %@", self.model)
                    
                    self.homeViewModelDelegate!.RealodDataFinished(state: ServiceResponse.success)
                    
                }
        
    }
    
}
