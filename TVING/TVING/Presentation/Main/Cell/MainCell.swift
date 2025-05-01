//
//  MainCell.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class MainCell: BaseCollectionViewCell {
    
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
        contentView.do {
            $0.backgroundColor = .green
        }
        
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
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

extension MainCell {
    func dataBind(_ entertainmentContent: EntertainmentContent) {
        imageView.image = entertainmentContent.image
    }
}
