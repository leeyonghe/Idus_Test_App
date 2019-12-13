//
//  DetailViewModel.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/09.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation
import SVGKit
import Alamofire

protocol DetailViewModelDelegate {
    func LoadingStart()
    func RealodDataFinished(state : ServiceResponse)
}

protocol DetailViewModelProtocol {
    
    var model : DetailModel? { get set }
    
    func Network(_ url : String)
    
    func MakeCancelButton(_ cancelBtn : UIButton, ref : DetailViewController)
    
    func MakeImageScroll(_ contentView : UIView, _ images : [String], ref : DetailViewController)
    
}

class DetailViewModel : DetailViewModelProtocol{
    
    var detailViewModelDelegate : DetailViewModelDelegate?
    
    var model : DetailModel? = nil
    
    init(_ id : Int, _ detailViewModelDelegate: DetailViewModelDelegate) {
        self.detailViewModelDelegate = detailViewModelDelegate
        Network("\(AppConstants.base_url)products/\(id)")
    }
    
    func MakeCancelButton(_ cancelBtn : UIButton, ref : DetailViewController){
        let cancel: SVGKImage = SVGKImage(named: "cancel_24px")
        cancelBtn.setBackgroundImage(cancel.uiImage, for: UIControl.State.normal)
        cancelBtn.addTarget(ref, action: #selector(ref.cancelClicked), for: .touchUpInside)
    }
    
    func MakeImageScroll(_ contentView : UIView, _ images : [String], ref : DetailViewController){
        NSLog(">>>>>>>>>>>>>>> MakeImageScroll \(images)")
        let width = Int(contentView.bounds.size.width)
        let height = Int(contentView.bounds.size.height)
        let ScrollView = UIScrollView()
        ScrollView.isPagingEnabled = true
        ScrollView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        ScrollView.contentSize.width = CGFloat(width*images.count)
        for (index, image) in images.enumerated() {
            if let data = try? Data(contentsOf: URL(string: image)!) {
                if let image = UIImage(data: data) {
                    let picture = UIImageView(image: image)
                    NSLog(">>>>>>>>>>>>>>>> index \(index)")
                    let gap = index * width
                    NSLog(">>>>>>>>>>>>>>>> gap \(gap)")
                    picture.frame = CGRect(x: gap, y: 0, width: width, height: height)
                    picture.contentMode = .scaleToFill
                    picture.clipsToBounds = true
                    ScrollView.addSubview(picture)
                }
            }
        }
        contentView.addSubview(ScrollView)
    }
    
    func Network(_ url : String){
        self.detailViewModelDelegate?.LoadingStart()
        Alamofire.request(url,
                          method: .get)
                .validate()
                .responseJSON { response in
                 
                    guard response.result.isSuccess else {
                        print("Error while fetching remote : \(String(describing:response.result.error))")
                        self.detailViewModelDelegate!.RealodDataFinished(state: ServiceResponse.failure)
                        return
                    }

                    guard let value = response.result.value as? [String: Any],
                        let jsonobj = value["body"] as? [[String: Any]] else {
                        print("data received from service")
                        self.detailViewModelDelegate!.RealodDataFinished(state: ServiceResponse.failure)
                        return
                    }
                    
                    NSLog(">>>>>>>>>>>>>>>>>>>>>>> jsonobj \(jsonobj[0])")
                  
                    self.model = DetailModel(jsonData: jsonobj[0])
                    
                    self.detailViewModelDelegate!.RealodDataFinished(state: ServiceResponse.success)
                    
                }
        
    }
    
}
