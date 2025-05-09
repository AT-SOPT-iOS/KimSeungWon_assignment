//
//  BaseViewController.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

import SnapKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setAction()
        setDelegate()
        
        hideKeyboardWhenDidTap()
    }
    
    /// 네비게이션 바 등 추가적으로 UI와 관련한 작업
    func setView() {}
    
    /// RootView로부터 액션 설정 (addTarget)
    func setAction() {}
    
    /// RootView 또는 ViewController 자체로부터 Delegate, DateSource 등 설정
    func setDelegate() {}
}
