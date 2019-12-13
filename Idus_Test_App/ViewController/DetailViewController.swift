//
//  DetailViewController.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/09.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit
import RMPZoomTransitionAnimator

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

class DetailViewController : UIViewController, DetailViewModelDelegate {
    
    @IBOutlet var cancelBtn: UIButton!
    
    @IBOutlet var HorizonScroll: UIView!
    
    @IBOutlet var VerticalScroll: UIScrollView!
    
    @IBOutlet var verticalContentView: UIView!
    
    var id : Int = 0
    
    var viewModel : DetailViewModel? = nil
    
    override func viewDidLoad() {
        
        self.viewModel = DetailViewModel(id, self)
        
        self.viewModel!.MakeCancelButton(self.cancelBtn, ref: self)
        
        self.VerticalScroll.contentInset = UIEdgeInsets(top: 13, left: 0, bottom: 0, right: 0)
        
        self.verticalContentView.clipsToBounds = true
        self.verticalContentView.layer.cornerRadius = 30
        self.verticalContentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    @objc func cancelClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func LoadingStart() {
        
    }
    
    func RealodDataFinished(state: ServiceResponse) {
        self.viewModel!.MakeImageScroll(self.HorizonScroll, viewModel!.model!.thumbnaillist320, ref: self)
    }
    
}
