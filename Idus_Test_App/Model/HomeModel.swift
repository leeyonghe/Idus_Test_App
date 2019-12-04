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

protocol HomeModel {
    var id : Int { get }
    var thumbnail_520 : String { get }
    var title : String { get }
    var seller : String { get }
}
