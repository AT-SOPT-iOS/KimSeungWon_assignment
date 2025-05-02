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
    
    private let homeLabel = UILabel()
    
    private let dramaLabel = UILabel()
    
    private let entertainmentLabel = UILabel()
    
    private let movieLabel = UILabel()
    
    private let sportsLabel = UILabel()
    
    private let newsLabel = UILabel()
    
    private let segmentStackView = UIStackView()
    
    private let underLineView = UILabel()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - UI Setting
    
    override func setStyle() {
        navigationContainerView.do {
            $0.backgroundColor = .primaryBlack
        }

        homeLabel.do {
            $0.text = "홈"
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.regular, size: 17)
        }
        
        dramaLabel.do {
            $0.text = "드라마"
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.regular, size: 17)
        }
        
        entertainmentLabel.do {
            $0.text = "예능"
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.regular, size: 17)
        }
        
        movieLabel.do {
            $0.text = "영화"
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.regular, size: 17)
        }
        
        sportsLabel.do {
            $0.text = "스포츠"
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.regular, size: 17)
        }
        
        newsLabel.do {
            $0.text = "뉴스"
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.regular, size: 17)
        }
        
        segmentStackView.do {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .equalSpacing
        }
        
        underLineView.do {
            $0.backgroundColor = .primaryWhite
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
        addSubviews(navigationContainerView, segmentStackView, underLineView, collectionView)
        
        navigationContainerView.addSubviews(tvingLogoImageView, profileImageView, magnifyingGlassButton)
        
        segmentStackView.addArrangedSubviews(
            homeLabel,
            dramaLabel,
            entertainmentLabel,
            movieLabel,
            sportsLabel,
            newsLabel
        )
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
        
        segmentStackView.snp.makeConstraints {
            $0.top.equalTo(navigationContainerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.height.equalTo(27)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentStackView.snp.bottom).offset(7)
            $0.leading.equalTo(segmentStackView.snp.leading)
            $0.width.equalTo(homeLabel.snp.width)
            $0.height.equalTo(3)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(segmentStackView.snp.bottom).offset(17)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
