//
//  HomeViewController.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/04.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit
import Kingfisher
import SVGKit

class HomeViewController : UIViewController {
    
    var viewModel = HomeViewModel()
    
    @IBOutlet var table: UICollectionView!
    
    override func viewDidLoad() {
        initView()
    }
    
    func initView() {
        let storefront: SVGKImage = SVGKImage(named: "storefront_24px")
        self.navigationItem.titleView = UIImageView(image: storefront.uiImage)
        viewModel.homeViewModelDelegate = self
        viewModel.initDataload()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let controller = segue.destination as! DetailViewController
            controller.id = sender as! Int
        }
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
            .scaleFactor(1.0),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
        
        cell.title.text = model.title
        
        cell.seller.text = model.seller
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.viewModel.model[indexPath.row]
        self.performSegue(withIdentifier: "detail", sender: model.id)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWithd = collectionView.frame.width / 2 - 1
        return CGSize(width: collectionViewCellWithd, height: 258)
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
