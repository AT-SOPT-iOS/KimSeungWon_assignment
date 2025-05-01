//
//  ReuseIdentifiable.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import Foundation

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String { String(describing: Self.self) }
}
