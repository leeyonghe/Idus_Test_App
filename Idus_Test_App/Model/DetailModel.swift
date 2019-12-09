//
//  DetailModel.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/09.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation

//Column    Type    Description
//id    Integer    상품 코드
//thumbnail_720    String    썸네일 이미지 (720 size)
//thumbnaillist320    String    썸네일 이미지 (320 size) -> 각 이미지는 #으로 구분되어있음
//title    String    게시글 제목
//seller    String    게시글 작성자
//cost    String    상품 원가
//discount_cost    String    상품 할인가
//discount_rate    String    상품 할인율
//description    String    상품 설명

struct DetailModel{
    let id : Int
    let thumbnail_720 : String
    let thumbnaillist320 : String
    let title :   String
    let seller :   String
    let cost :   String
    let discount_cost :   String
    let discount_rate :   String
    let description : String
    init(id : Int,
         thumbnail_720 : String,
         thumbnaillist320 : String,
         title : String,
         seller : String,
         cost : String,
         discount_cost : String,
         discount_rate : String,
         description : String){
            self.id = id
            self.thumbnail_720 = thumbnail_720
            self.thumbnaillist320 = thumbnaillist320
            self.title = title
            self.seller = seller
            self.cost = cost
            self.discount_cost = discount_cost
            self.discount_rate = discount_rate
            self.description = description
    }
    init?(jsonData : [String: Any]){
        guard let id = jsonData["id"] as? Int else {
            return nil
        }
        guard let thumbnail_720 = jsonData["thumbnail_720"] as? String else {
            return nil
        }
        guard let thumbnaillist320 = jsonData["thumbnaillist320"] as? String else {
            return nil
        }
        guard let title = jsonData["title"] as? String else {
            return nil
        }
        guard let seller = jsonData["seller"] as? String else {
            return nil
        }
        guard let cost = jsonData["cost"] as? String else {
            return nil
        }
        guard let discount_cost = jsonData["discount_cost"] as? String else {
            return nil
        }
        guard let discount_rate = jsonData["discount_rate"] as? String else {
            return nil
        }
        guard let description = jsonData["description"] as? String else {
            return nil
        }
        self.init(id:id,thumbnail_720 : thumbnail_720,
                    thumbnaillist320 : thumbnaillist320,
                    title : title,
                    seller : seller,
                    cost : cost,
                    discount_cost : discount_cost,
                    discount_rate : discount_rate,
                    description : description)
    }
}
