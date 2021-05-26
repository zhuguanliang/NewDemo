//
//  NewsListViewModel.swift
//  NewDemo
//
//  Created by 朱官亮 on 2021/5/25.
//

import Foundation

class  NewsListViewModel {
    var newsVM = [NewsViewModel]()
    
    let reauseID = "news"
    func getNews(Completion: @escaping ([NewsViewModel]) -> Void) {
        NetworkManager.shared.getNews { (news) in
            guard let news = news else {  return }
            let newsVM = news.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsVM = newsVM
                Completion(newsVM)
            }
            
        }
    }
    
    
}
