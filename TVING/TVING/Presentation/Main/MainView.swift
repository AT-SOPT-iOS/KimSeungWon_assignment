//
//  MainView.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

class MainView: BaseView {
    
    // MARK: - UI Setting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .red
        }
    }
}
