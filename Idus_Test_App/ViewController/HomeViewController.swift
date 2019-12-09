//
//  HomeViewController.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/04.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController : UIViewController {
    
    var viewModel = HomeViewModel()
    
    @IBOutlet var table: UICollectionView!
    
    override func viewDidLoad() {
        initView()
        viewModel.homeViewModelDelegate = self
        viewModel.initDataload()
    }
    
    func initView() {
//        let nibName = UINib(nibName: "HomeViewCell", bundle: nil)
//        table.register(nibName, forCellReuseIdentifier: "Cell")
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getModelCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = self.viewModel.model[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeViewCell
        
        let url = URL(string: model.thumbnail_520)
        
        let processor = DownsamplingImageProcessor(size: cell.thumbnail_520.bounds.size) |> RoundCornerImageProcessor(cornerRadius: 20)
        cell.thumbnail_520.kf.indicatorType = .activity
        cell.thumbnail_520.kf.setImage(
            with: url,
            placeholder: UIImage(named: "no_image"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
        cell.title.text = model.title
        
        cell.seller.text = model.seller
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWithd = collectionView.frame.width / 2 - 1
        return CGSize(width: collectionViewCellWithd, height: 281)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

extension HomeViewController : HomeViewModelDelegate{
    
    func LoadingStart() {
//        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
//        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//        loadingIndicator.hidesWhenStopped = true
//        loadingIndicator.style = UIActivityIndicatorView.Style.large
//        loadingIndicator.startAnimating();
//        alert.view.addSubview(loadingIndicator)
//        present(alert, animated: true, completion: nil)
    }
    
    func RealodDataFinished(state: ServiceResponse) {
        switch state {
            case .success:
            
                break;
            case .failure:
                
                break;
        }
        self.table.reloadData()
//        dismiss(animated: false, completion: nil)
    }
    
}
