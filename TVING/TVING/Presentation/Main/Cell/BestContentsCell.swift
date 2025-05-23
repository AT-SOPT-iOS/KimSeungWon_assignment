//
//  BestContentsCell.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class BestContentsCell: BaseCollectionViewCell {
    
    // MARK: - UI Properties
    
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
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.setCornerRadius(5)
        }
    }
    
    override func setUI() {
        contentView.addSubview(imageView)
    }
    
    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Functions

extension BestContentsCell {
    func configure(_ entertainmentContent: EntertainmentContent) {
        imageView.image = entertainmentContent.image
    }
}
