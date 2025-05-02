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
    
    let navigationContainerView = UIView()
    
    private let tvingLogoImageView = UIImageView()
    
    private let magnifyingGlassButton = UIButton()
    
    private let profileImageView = UIImageView()
    
    private let segmentedControl = UIView()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - UI Setting
    
    override func setStyle() {
        navigationContainerView.do {
            $0.backgroundColor = .primaryBlack
        }
        
        segmentedControl.do {
            $0.backgroundColor = .blue
        }
        
        collectionView.do {
            $0.backgroundColor = .primaryBlack
        }
        
        tvingLogoImageView.do {
            $0.image = .tvingLogo
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        profileImageView.do {
            $0.image = .profile
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        magnifyingGlassButton.do {
            $0.setImage(.magnifyingGlassIcon, for: .normal)
        }
    }
    
    override func setUI() {
        addSubviews(navigationContainerView, segmentedControl, collectionView)
        
        navigationContainerView.addSubviews(tvingLogoImageView, profileImageView, magnifyingGlassButton)
    }
    
    override func setLayout() {
        navigationContainerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(78)
        }
        
        tvingLogoImageView.snp.makeConstraints {
            $0.leading.verticalEdges.equalToSuperview()
            $0.width.equalTo(191)
        }
        
        profileImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(11)
            $0.size.equalTo(30)
            $0.centerY.equalToSuperview()
        }
        
        magnifyingGlassButton.snp.makeConstraints {
            $0.trailing.equalTo(profileImageView.snp.leading).offset(-10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(navigationContainerView.snp.bottom)
            $0.height.equalTo(55)
            $0.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
