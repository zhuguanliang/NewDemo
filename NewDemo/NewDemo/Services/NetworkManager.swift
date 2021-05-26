//
//  NetworkManager.swift
//  NewDemo
//
//  Created by 朱官亮 on 2021/4/25.
//

import Foundation

class NetworkManager {
    let imageCache = NSCache<NSString,NSData>()
    static let shared = NetworkManager()
    private init () {}
    
    private let baseUrlString = "https://newsapi.org/v2/"
    private let USTopHeadline = "top-headlines?country=us"
    
    func getNews(Completion: @escaping ([News]?) -> Void) {
        
        let urlString = "\(baseUrlString)\(USTopHeadline)&apikey=\(APIKey.key)"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (date, response, error) in
            guard error == nil, let data = date else{
                Completion(nil)
                return
            }
            let newsEnvelope = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsEnvelope == nil ? Completion(nil) : Completion(newsEnvelope!.articles)
        }.resume()
    }
    func getImage(urlString: String,Completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            Completion(nil)
            return
        }
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            Completion(cachedImage as Data)
        }else {
            URLSession.shared.dataTask(with: url) { (date, response, error) in
                guard error == nil, let data = date else{
                    Completion(nil)
                    return
                }
                self.imageCache.setObject(date as! NSData, forKey: NSString(string: urlString))
                Completion(date)
                
            }.resume()
        }

    }
    
}
