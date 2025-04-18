//
//  WelcomeViewController.swift
//  TVING
//
//  Created by 김승원 on 4/18/25.
//

import UIKit

import SnapKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let bannerImageView = UIImageView()
    
    private let goToMainButton = TvingRedButton("메인으로")
    
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
    }
    
    func setUI() {
        view.addSubviews(bannerImageView, goToMainButton)
    }
    
    func setLayout() {
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(211)
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
