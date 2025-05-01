//
//  TodaysTvingCell.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class TodaysTvingCell: BaseCollectionViewCell {
    
    // MARK: - UI Properties
    
    private let rankingLabel = UILabel()
    
    private let imageView = UIImageView()
    
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
        rankingLabel.do {
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.semiBold, size: 50)
        }
        
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }
    
    override func setUI() {
        contentView.addSubviews(rankingLabel, imageView)
    }
    
    override func setLayout() {
        rankingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(98)
        }
    }
}

// MARK: - Functions

extension TodaysTvingCell {
    func configure(_ entertainmentContent: EntertainmentContent) {
        rankingLabel.text = entertainmentContent.ranking
        imageView.image = entertainmentContent.image
    }
}
