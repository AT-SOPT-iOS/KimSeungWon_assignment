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

extension EntertainmentContent {
    /// mainPoster 섹션 mockData
    static var mainPosterMockData: [Self] {
        [
            EntertainmentContent(image: .poster1),
            EntertainmentContent(image: .poster2),
            EntertainmentContent(image: .poster3),
            EntertainmentContent(image: .poster4),
            EntertainmentContent(image: .poster5)
        ]
    }
    
    /// today 섹션 mockData
    static var todaysTvingMockData: [Self] {
        [
            EntertainmentContent(image: .poster2, ranking: "1"),
            EntertainmentContent(image: .poster4, ranking: "2"),
            EntertainmentContent(image: .poster3, ranking: "3"),
            EntertainmentContent(image: .poster1, ranking: "4"),
            EntertainmentContent(image: .poster5, ranking: "5")
        ]
    }
    
    
}
