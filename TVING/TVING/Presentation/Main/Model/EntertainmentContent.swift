//
//  EntertainmentContent.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

struct EntertainmentContent {
    var image: UIImage
    var rank: Int = 0
    var title: String = ""
    var episode: String = ""
    var rating: String = ""
}

extension EntertainmentContent {
    static var mainMockData: [Self] {
        [
            EntertainmentContent(image: .poster1),
            EntertainmentContent(image: .poster2),
            EntertainmentContent(image: .poster3),
            EntertainmentContent(image: .poster4),
            EntertainmentContent(image: .poster5)
        ]
    }
}
