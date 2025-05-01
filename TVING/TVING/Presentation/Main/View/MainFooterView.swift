//
//  MainFooterView.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class MainFooterView: BaseCollectionReusableView {
    
    // MARK: - UI Properties
    
    private let noticeBackView = UIView()
    
    private let noticeTitleLabel = UILabel()
    
    private let noticeLabel = UILabel()
    
    private let noticeButton = UIButton(type: .system)
    
    private let personalInformationLabel = UILabel()
    
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
        
        noticeBackView.do {
            $0.backgroundColor = .gray4
            $0.setCornerRadius(5)
        }
        
        noticeTitleLabel.do {
            $0.text = "공지"
            $0.textColor = .gray2
            $0.font = .pretendard(.regular, size: 11)
        }
        
        noticeLabel.do {
            $0.text = "티빙 계정 공유 정책 추가 안내"
            $0.textColor = .gray1
            $0.font = .pretendard(.regular, size: 11)
        }
        
        noticeButton.do {
            $0.setImage(.chevronRightIcon, for: .normal)
            $0.tintColor = .gray1
        }
        
        personalInformationLabel.do {
            $0.text = "고객문의 · 이용약관 · 개인정보처리방침\n사업자정보 · 인재채용"
            $0.textColor = .gray2
            $0.font = .pretendard(.regular, size: 11)
            $0.numberOfLines = 2
            $0.textAlignment = .left
            $0.setLineSpacing(spacing: 4)
        }
    }
    
    override func setUI() {
        addSubviews(noticeBackView, personalInformationLabel)
        
        noticeBackView.addSubviews(
            noticeTitleLabel,
            noticeLabel,
            noticeButton,
        )
    }
    
    override func setLayout() {
        noticeBackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        noticeTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(17)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(noticeTitleLabel.snp.trailing).offset(8)
        }
        
        noticeButton.snp.makeConstraints {
            $0.size.equalTo(18)
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        personalInformationLabel.snp.makeConstraints {
            $0.top.equalTo(noticeBackView.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview().inset(8)
        }
    }
}
