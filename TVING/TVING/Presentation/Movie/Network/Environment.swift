//
//  Environment.swift
//  TVING
//
//  Created by 김승원 on 5/9/25.
//

import Foundation

enum Environment {
    static let key: String = Bundle.main.infoDictionary?["KEY"] as! String
}
