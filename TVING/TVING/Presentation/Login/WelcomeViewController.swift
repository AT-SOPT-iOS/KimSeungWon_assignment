//
//  WelcomeViewController.swift
//  TVING
//
//  Created by 김승원 on 4/18/25.
//

import UIKit

import SnapKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let id: String
    
    // MARK: - UI Properties
    
    private let bannerImageView = UIImageView()
    
    private let greetingLabel = UILabel()
    
    private let goToMainButton = TvingRedButton("메인으로")
    
    // MARK: - Initializer
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setView()
    }
}

// MARK: - UI Setting

private extension WelcomeViewController {
    func setStyle() {
        view.do {
            $0.backgroundColor = .primaryBlack
        }
        
        bannerImageView.do {
            $0.image = .banner
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        greetingLabel.do {
            $0.text = "\(id)님\n반가워요!"
            $0.font = .pretendard(.bold, size: 23)
            $0.setLineSpacing(spacing: 15)
            $0.textColor = .gray1
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
    }
    
    func setUI() {
        view.addSubviews(bannerImageView, greetingLabel, goToMainButton)
    }
    
    func setLayout() {
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(211)
        }
        
        greetingLabel.snp.makeConstraints {
            $0.top.equalTo(bannerImageView.snp.bottom).offset(75)
            $0.centerX.equalToSuperview()
        }
        
        goToMainButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(11)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}

// MARK: - Functions

extension WelcomeViewController {
    private func setView() {
        navigationController?.navigationBar.isHidden = true
    }
}
