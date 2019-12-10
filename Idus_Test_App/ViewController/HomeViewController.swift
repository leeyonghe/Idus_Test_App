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
    var alert = UIAlertController(title: nil, message: "", preferredStyle: .alert)
    @IBOutlet var table: UICollectionView!
    
    override func viewDidLoad() {
        initView()
    }
    
    func initView() {
        let storefront: SVGKImage = SVGKImage(named: "storefront_24px")
        self.navigationItem.titleView = UIImageView(image: storefront.uiImage)
        viewModel.homeViewModelDelegate = self
        viewModel.addDataList()
        
        let indicator = UIActivityIndicatorView(frame: self.view.bounds)
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        indicator.isUserInteractionEnabled = false
        indicator.startAnimating()
        alert.view.addSubview(indicator)
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
        
        let scale = UIScreen.main.scale
        let size = cell.thumbnail_520.bounds.size
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: size.width * scale, height: size.height * scale)) |> RoundCornerImageProcessor(cornerRadius: 20)
        cell.thumbnail_520.kf.indicatorType = .activity
        cell.thumbnail_520.kf.setImage(
        with: url,
        placeholder: UIImage(named: "no_image"),
        options: [
            .processor(processor),
            .scaleFactor(1.0),
            .transition(.fade(1)),
            .cacheOriginalImage,
        ])
        
        cell.title.text = model.title
        
        cell.seller.text = model.seller
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionFooter) {
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterReusableView", for: indexPath) as! HomeViewFooter
            
            let storefront: SVGKImage = SVGKImage(named: "loop_24px")
            
            footerView.icon.image = storefront.uiImage
            
            FooterIconAnimation(footerView.icon)
            
            return footerView
            
        }else{
            fatalError()
        }
        
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            viewModel.addDataList()
        }
    }
    
    func FooterIconAnimation(_ footerView : UIImageView){
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.duration = 1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.repeatCount = .infinity
        animation.values = [0, Double.pi/2, Double.pi, Double.pi*3/2, Double.pi*2]
        animation.keyTimes = [NSNumber(value: 0.0), NSNumber(value: 0.1),NSNumber(value: 0.3), NSNumber(value: 0.8), NSNumber(value: 1.0)]
        footerView.layer.add(animation, forKey: "rotate")
    }
    
}

extension HomeViewController : HomeViewModelDelegate{
    
    func LoadingStart() {
//        present(self.alert, animated: true, completion: nil)
    }
    
    func RealodDataFinished(state: ServiceResponse) {
//        self.alert.dismiss(animated: true, completion: nil)
        switch state {
            case .success:
            
                break;
            case .failure:
                
                break;
        }
        self.table.reloadData()
    }
    
}
