//
//  HomeModel.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/04.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation

//Column    Type    Description
//id    Integer    상품 코드
//thumbnail_520    String    썸네일 이미지 (520 size)
//title    String    게시글 제목
//seller    String    게시글 작성자

struct  HomeModel {
    let id : Int
    let thumbnail_520 : String
    let title : String
    let seller : String
    init(id : Int, thumbnail_520 : String, title : String, seller : String) {
        self.id = id
        self.thumbnail_520 = thumbnail_520
        self.title = title
        self.seller = seller
    }
    init?(jsonData : [String: Any]){
        guard let id = jsonData["id"] as? Int else {
            return nil
        }
        guard let thumbnail_520 = jsonData["thumbnail_520"] as? String else {
            return nil
        }
        guard let title = jsonData["title"] as? String else {
            return nil
        }
        guard let seller = jsonData["seller"] as? String else {
            return nil
        }
        self.init(id:id,thumbnail_520:thumbnail_520, title:title,seller:seller)
    }
}
