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
    
    private let loginButton = TvingRedButton("로그인하기", isEnabled: false)
    
    private let findIdButton = UIButton(type: .system)
    private let findPasswordButton = UIButton(type: .system)
    private let dividerView = UIView()
    private let findStackView = UIStackView()
    
    private let noAccountLabel = UILabel()
    private let makeNicknameButton = UIButton(type: .system)
    private let nicknameStackView = UIStackView()
    
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
        
        findIdButton.setTitle("아이디 찾기", for: .normal)
        findIdButton.setTitleColor(.gray2, for: .normal)
        findIdButton.titleLabel?.font = .pretendard(.semiBold, size: 14)
        
        findPasswordButton.setTitle("비밀번호 찾기", for: .normal)
        findPasswordButton.setTitleColor(.gray2, for: .normal)
        findPasswordButton.titleLabel?.font = .pretendard(.semiBold, size: 14)
        
        dividerView.backgroundColor = .gray4
        
        findStackView.spacing = 33
        findStackView.alignment = .center
        findStackView.distribution = .fill
        findStackView.axis = .horizontal
        
        noAccountLabel.text = "아직 계정이 없으신가요?"
        noAccountLabel.textColor = .gray3
        noAccountLabel.font = .pretendard(.semiBold, size: 14)
        
        makeNicknameButton.setTitle("닉네임 만들러가기", for: .normal)
        makeNicknameButton.setTitleColor(.gray2, for: .normal)
        makeNicknameButton.titleLabel?.font = .pretendard(.regular, size: 14)
        makeNicknameButton.addUnderline()
        
        nicknameStackView.spacing = 17
        nicknameStackView.alignment = .fill
        nicknameStackView.distribution = .fill
        nicknameStackView.axis = .horizontal
    }
    
    func setUI() {
        view.addSubviews(loginLabel, idTextField, passwordTextField, loginButton, findStackView, nicknameStackView)
        
        idTextFieldRightView.addSubview(idClearButton)
        passwordTextFieldRightView.addSubviews(passwordClearButton, passwordSecureButton)
        
        findStackView.addArrangedSubviews(findIdButton, dividerView, findPasswordButton)
        
        nicknameStackView.addArrangedSubviews(noAccountLabel, makeNicknameButton)
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
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        findIdButton.snp.makeConstraints {
            $0.height.equalTo(22)
        }
        
        findPasswordButton.snp.makeConstraints {
            $0.height.equalTo(22)
        }
        
        dividerView.snp.makeConstraints {
            $0.width.equalTo(2)
            $0.height.equalTo(12)
        }
        
        findStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
        }
        
        noAccountLabel.snp.makeConstraints {
            $0.height.equalTo(22)
        }
        
        makeNicknameButton.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.width.equalTo(128)
        }
        
        nicknameStackView.snp.makeConstraints {
            $0.top.equalTo(findStackView.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
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
        idTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        idClearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        passwordClearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        passwordSecureButton.addTarget(self, action: #selector(secureButtonDidTap), for: .touchUpInside)
        
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private func toggleLoginButton(_ isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
    }
    
    @objc
    private func textFieldEditingChanged() {
        var isButtonEnabled = false
        
        if let id = idTextField.text, !id.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
            isButtonEnabled = true
        }
        
        toggleLoginButton(isButtonEnabled)
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
        toggleLoginButton(false)
    }
    
    @objc
    private func secureButtonDidTap() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc
    private func loginButtonDidTap() {
        print("로그인 버튼 눌림")
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
