//
//  PlatformCell.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class PlatformCell: BaseCollectionViewCell {
    
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
        contentView.do {
            $0.backgroundColor = .gray4
            $0.setCornerRadius(5)
        }
        
        imageView.do {
            $0.contentMode = .scaleAspectFill
        }
    }
    
    override func setUI() {
        contentView.addSubview(imageView)
    }
    
    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(68)
            $0.height.equalTo(34)
        }
    }
}

// MARK: - Functions

extension PlatformCell {
    func configure(_ entertainmentContent: EntertainmentContent) {
        imageView.image = entertainmentContent.image
    }
}
