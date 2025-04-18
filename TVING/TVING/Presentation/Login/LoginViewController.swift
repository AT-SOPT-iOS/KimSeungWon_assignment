//
//  LoginViewController.swift
//  TVING
//
//  Created by 김승원 on 4/17/25.
//

import UIKit

import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let loginLabel = UILabel()
    
    private let idTextField = TvingTextField(.id)
    private let passwordTextField = TvingTextField(.password)
    
    private let idTextFieldRightView = UIView()
    private let passwordTextFieldRightView = UIView()
    
    private let idClearButton = UIButton()
    private let passwordClearButton = UIButton()
    private let passwordSecureButton = UIButton()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setDelegate()
        setAction()
        hideKeyboardWhenDidTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setView()
    }
}

// MARK: - UI Setting

private extension LoginViewController {
    func setStyle() {
        view.backgroundColor = .primaryBlack
        
        loginLabel.text = "TVING ID 로그인"
        loginLabel.font = .pretendard(.regular, size: 23)
        loginLabel.textColor = .gray1
        loginLabel.textAlignment = .center
        
        idTextField.rightView = idTextFieldRightView
        idTextField.tag = 0
        passwordTextField.rightView = passwordTextFieldRightView
        passwordTextField.tag = 1
        
        idClearButton.setImage(.xIcon, for: .normal)
        idClearButton.tag = 0
        passwordClearButton.setImage(.xIcon, for: .normal)
        passwordClearButton.tag = 1
        passwordSecureButton.setImage(.eyeSlashIcon, for: .normal)
    }
    
    func setUI() {
        view.addSubviews(loginLabel, idTextField, passwordTextField)
        
        idTextFieldRightView.addSubview(idClearButton)
        passwordTextFieldRightView.addSubviews(passwordClearButton, passwordSecureButton)
    }
    
    func setLayout() {
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(90)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(27)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(11)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        idClearButton.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(22)
            $0.size.equalTo(20)
        }
        
        passwordClearButton.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(20)
        }
        
        passwordSecureButton.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(passwordClearButton.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(22)
            $0.size.equalTo(20)
        }
    }
}

// MARK: - Functions

extension LoginViewController {
    private func setView() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setAction() {
        idClearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        passwordClearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        passwordSecureButton.addTarget(self, action: #selector(secureButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func clearButtonDidTap(_ sender: UITextField) {
        switch sender.tag {
        case 0:
            idTextField.text = nil
        case 1:
            passwordTextField.text = nil
        default:
            break
        }
    }
    
    @objc
    private func secureButtonDidTap() {
        passwordTextField.isSecureTextEntry.toggle()
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
}
