//
//  News.swift
//  NewDemo
//
//  Created by 朱官亮 on 
//

import Foundation

struct News: Decodable {
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    
}

struct NewsEnvelope: Decodable {
    let Status : String?
    let totalResuls : String?
    let articles : [News]
    
}
