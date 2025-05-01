//
//  MainHeaderView.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class MainHeaderView: BaseCollectionReusableView {
    
    // MARK: - UI Properties
    
    private let titleLabel = UILabel()
    
    private let seeMoreButton = UIButton(type: .system)
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .primaryBlack
        }
        
        titleLabel.do {
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.bold, size: 15)
        }
        
        seeMoreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .pretendard(.regular, size: 12)
        }
    }
    
    override func setUI() {
        addSubviews(titleLabel, seeMoreButton)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        seeMoreButton.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(4)
        }
    }
}

// MARK: - Functions

extension MainHeaderView {
    func configure(title: String, isHidden: Bool = true) {
        titleLabel.text = title
        seeMoreButton.isHidden = isHidden
    }
}
