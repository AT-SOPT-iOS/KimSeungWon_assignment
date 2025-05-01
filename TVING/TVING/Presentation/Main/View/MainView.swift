//
//  MainView.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class MainView: BaseView {
    
    // MARK: - UI Properties
    
    private let segmentedControl = UIView()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - UI Setting
    
    override func setStyle() {
        segmentedControl.do {
            $0.backgroundColor = .blue
        }
        
        collectionView.do {
            $0.backgroundColor = .yellow
        }
    }
    
    override func setUI() {
        addSubviews(segmentedControl, collectionView)
    }
    
    override func setLayout() {
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(55)
            $0.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
