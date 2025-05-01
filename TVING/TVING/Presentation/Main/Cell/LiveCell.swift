//
//  LiveCell.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class LiveCell: BaseCollectionViewCell {
    
    // MARK: - UI Properties
    
    private let imageView = UIImageView()
    
    private let rankingLabel = UILabel()
    
    private let titleLabel = UILabel()
    
    private let episodeLabel = UILabel()
    
    private let ratingLabel = UILabel()
    
    private let stackView = UIStackView()
    
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
        contentView.do {
            $0.backgroundColor = .primaryBlack
        }
        
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.setCornerRadius(5)
        }
        
        rankingLabel.do {
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.bold, size: 19)
        }
        
        titleLabel.do {
            $0.textColor = .primaryWhite
            $0.font = .pretendard(.semiBold, size: 10)
        }
        
        episodeLabel.do {
            $0.textColor = .gray2
            $0.font = .pretendard(.regular, size: 10)
        }
        
        ratingLabel.do {
            $0.textColor = .gray2
            $0.font = .pretendard(.regular, size: 10)
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 0
            $0.alignment = .leading
            $0.distribution = .fillEqually
        }
    }
    
    override func setUI() {
        contentView.addSubviews(imageView, rankingLabel, stackView)
        
        stackView.addArrangedSubviews(titleLabel, episodeLabel, ratingLabel)
    }
    
    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(8)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(48)
        }
    }
}

// MARK: - Functions

extension LiveCell {
    func configure(_ entertainmentContent: EntertainmentContent) {
        imageView.image = entertainmentContent.image
        rankingLabel.text = entertainmentContent.ranking
        titleLabel.text = entertainmentContent.title
        episodeLabel.text = entertainmentContent.episode
        ratingLabel.text = entertainmentContent.rating
    }
}
