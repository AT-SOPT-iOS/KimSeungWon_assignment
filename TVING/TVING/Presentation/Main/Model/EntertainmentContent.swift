//
//  EntertainmentContent.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

struct EntertainmentContent {
    var image: UIImage
    var ranking: String = ""
    var title: String = ""
    var episode: String = ""
    var rating: String = ""
}

// MARK: - Mock Data

extension EntertainmentContent {
    /// mainPoster section mockData
    static var mainPosterMockData: [Self] {
        [
            EntertainmentContent(image: .poster1),
            EntertainmentContent(image: .poster2),
            EntertainmentContent(image: .poster3),
            EntertainmentContent(image: .poster4),
            EntertainmentContent(image: .poster5)
        ]
    }
    
    /// today section mockData
    static var todaysTvingMockData: [Self] {
        [
            EntertainmentContent(image: .poster2, ranking: "1"),
            EntertainmentContent(image: .poster4, ranking: "2"),
            EntertainmentContent(image: .poster3, ranking: "3"),
            EntertainmentContent(image: .poster1, ranking: "4"),
            EntertainmentContent(image: .poster5, ranking: "5")
        ]
    }
    
    /// live section mockData
    static var liveMockData: [Self] {
        [
            EntertainmentContent(image: .live1, ranking: "1", title: "지구오락실2", episode: "3화", rating: "27.7%"),
            EntertainmentContent(image: .live2, ranking: "2", title: "환승연애3", episode: "6화", rating: "24.1%"),
            EntertainmentContent(image: .live3, ranking: "3", title: "별들에게 물어봐", episode: "13화", rating: "21.9%"),
            EntertainmentContent(image: .live4, ranking: "4", title: "언젠가는 슬기로울 전공의생활", episode: "1화", rating: "18.2%"),
            EntertainmentContent(image: .live5, ranking: "5", title: "이혼보험", episode: "1화", rating: "13.8%"),
            EntertainmentContent(image: .live6, ranking: "6", title: "선재업고튀어", episode: "21화", rating: "11.1%"),
        ]
    }
    
    /// movie section mockData
    static var movieMockData: [Self] {
        [
            EntertainmentContent(image: .movie1),
            EntertainmentContent(image: .movie2),
            EntertainmentContent(image: .movie3),
            EntertainmentContent(image: .movie1),
            EntertainmentContent(image: .movie2),
            EntertainmentContent(image: .movie3)
        ]
    }
    
    /// baseball section mockData
    static var baseballMockData: [Self] {
        [
            EntertainmentContent(image: .baseball1),
            EntertainmentContent(image: .baseball2),
            EntertainmentContent(image: .baseball3),
            EntertainmentContent(image: .baseball4),
            EntertainmentContent(image: .baseball5),
            EntertainmentContent(image: .baseball6),
            EntertainmentContent(image: .baseball7),
            EntertainmentContent(image: .baseball8),
            EntertainmentContent(image: .baseball9)
        ]
    }
    
    // platform section mockData
    static var platformMockData: [Self] {
        [
            EntertainmentContent(image: .platform1),
            EntertainmentContent(image: .platform2),
            EntertainmentContent(image: .platform3),
            EntertainmentContent(image: .platform4),
            EntertainmentContent(image: .platform1),
            EntertainmentContent(image: .platform2)
        ]
    }
    
    // bestContents section mockData
    static var bestContentsMockData: [Self] {
        [
            EntertainmentContent(image: .live5),
            EntertainmentContent(image: .live4),
            EntertainmentContent(image: .live3),
            EntertainmentContent(image: .live2),
            EntertainmentContent(image: .live1)
        ]
    }
}
