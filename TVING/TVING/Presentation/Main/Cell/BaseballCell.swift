//
//  BaseballCell.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class BaseballCell: BaseCollectionViewCell {
    
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
        }
    }
    
    override func setUI() {
        contentView.addSubview(imageView)
    }
    
    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
}

// MARK: - Functions

extension BaseballCell {
    func configure(_ entertainmentContent: EntertainmentContent, row: Int) {
        setBackgroundColor(row)
        imageView.image = entertainmentContent.image
    }
    
    private func setBackgroundColor(_ row: Int) {
        contentView.do {
            $0.backgroundColor = row % 2 == 0 ? .primaryWhite : .primaryBlack
        }
    }
}
