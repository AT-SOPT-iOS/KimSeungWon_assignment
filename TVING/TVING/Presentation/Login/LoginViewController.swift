//
//  LoginViewController.swift
//  TVING
//
//  Created by 김승원 on 4/17/25.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private var nickname: String?
    
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
        hideKeyboardWhenDidTap(cancelsTouches: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setView()
    }
}

// MARK: - UI Setting

private extension LoginViewController {
    func setStyle() {
        view.do {
            $0.backgroundColor = .primaryBlack
        }
        
        loginLabel.do {
            $0.text = "TVING ID 로그인"
            $0.font = .pretendard(.regular, size: 23)
            $0.textColor = .gray1
            $0.textAlignment = .center
        }
        
        idTextField.do {
            $0.rightView = idTextFieldRightView
            $0.tag = 0
        }
        
        passwordTextField.do {
            $0.rightView = passwordTextFieldRightView
            $0.tag = 1
        }
        
        idClearButton.do {
            $0.setImage(.xIcon, for: .normal)
            $0.tag = 0
        }
        
        passwordClearButton.do {
            $0.setImage(.xIcon, for: .normal)
            $0.tag = 1
        }
        
        passwordSecureButton.do {
            $0.setImage(.eyeSlashIcon, for: .normal)
        }
        
        findIdButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        }
        
        findPasswordButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        }
        
        dividerView.do {
            $0.backgroundColor = .gray4
        }
        
        findStackView.do {
            $0.spacing = 33
            $0.alignment = .center
            $0.distribution = .fill
            $0.axis = .horizontal
        }
        
        noAccountLabel.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.textColor = .gray3
            $0.font = .pretendard(.semiBold, size: 14)
        }
        
        makeNicknameButton.do {
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .pretendard(.regular, size: 14)
            $0.addUnderline()
        }
        
        nicknameStackView.do {
            $0.spacing = 17
            $0.alignment = .fill
            $0.distribution = .fill
            $0.axis = .horizontal
        }
    }
    
    func setUI() {
        view.addSubviews(
            loginLabel,
            idTextField,
            passwordTextField,
            loginButton,
            findStackView,
            nicknameStackView
        )
        
        idTextFieldRightView.addSubview(idClearButton)
        
        passwordTextFieldRightView.addSubviews(passwordClearButton, passwordSecureButton)
        
        findStackView.addArrangedSubviews(findIdButton, dividerView, findPasswordButton)
        
        nicknameStackView.addArrangedSubviews(noAccountLabel, makeNicknameButton)
    }
    
    func setLayout() {
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(46)
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
        
        makeNicknameButton.addTarget(self, action: #selector(makeNicknameButtonDidTap), for: .touchUpInside)
    }
    
    private func toggleLoginButton(_ isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
    }
    
    private func presentNicknameSheet() {
        let nicknameSheetViewController = NicknameSheetViewController()
        let sheetDetent = UISheetPresentationController.Detent.custom { _ in
            return UIScreen.main.bounds.height / 2
        }
        
        if let sheet = nicknameSheetViewController.sheetPresentationController {
            sheet.detents = [sheetDetent]
            sheet.prefersGrabberVisible = false
            sheet.preferredCornerRadius = 20
        }
        
        nicknameSheetViewController.delegate = self
        nicknameSheetViewController.isModalInPresentation = false
        self.present(nicknameSheetViewController, animated: true)
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
        guard let id = idTextField.text, id.isValidEmail else {
            AlertManager.showAlert(on: self, title: "알림", message: "올바른 이메일 형식이 아닙니다.") { [weak self] action in
                guard let self else { return }
                self.idTextField.becomeFirstResponder()
            }
            return
        }
        
        guard let password = passwordTextField.text, password.isValidPassword else {
            AlertManager.showAlert(
                on: self,
                title: "알림",
                message:
                """
                올바른 비밀번호 형식이 아닙니다.
                8~15자 이내 영어 대소문자, 특수기호를 사용해 주세요.
                """
            ) { [weak self] action in
                guard let self else { return }
                passwordTextField.becomeFirstResponder()
            }
            return
        }
        
        let welcomeViewController = WelcomeViewController(id: id, nickname: nickname)
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func makeNicknameButtonDidTap() {
        presentNicknameSheet()
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            passwordTextField.becomeFirstResponder()
        case 1:
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
}

// MARK: - NicknameSheetViewControllerDelegate

extension LoginViewController: NicknameSheetViewControllerDelegate {
    func nicknameDidSubmit(_ nickname: String) {
        self.nickname = nickname
    }
}
