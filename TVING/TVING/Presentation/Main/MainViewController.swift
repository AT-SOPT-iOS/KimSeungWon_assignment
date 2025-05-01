//
//  MainViewController.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

class MainViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let rootView = MainView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
}
