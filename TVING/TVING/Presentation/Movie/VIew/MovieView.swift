//
//  MovieView.swift
//  TVING
//
//  Created by 김승원 on 5/9/25.
//

import UIKit

import SnapKit
import Then

final class MovieView: BaseView {
    
    // MARK: - UI Properties
    
    let searchTextField = TvingTextField(.search)
    
    let searchButton = TvingRedButton("검색")
    
    let boxOfficeLabel = UILabel()
    
    // MARK: - UI Setting
    
    override func setStyle() {
        boxOfficeLabel.do {
            $0.numberOfLines = 0
            $0.font = .pretendard(.regular, size: 20)
            $0.textColor = .primaryWhite
            $0.textAlignment = .left
        }
    }
    
    override func setUI() {
        addSubviews(searchTextField, searchButton, boxOfficeLabel)
    }
    
    override func setLayout() {
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-10)
            $0.height.equalTo(50)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(70)
            $0.height.equalTo(50)
        }
        
        boxOfficeLabel.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
    
}
