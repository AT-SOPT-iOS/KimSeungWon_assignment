//
//  AlertManager.swift
//  TVING
//
//  Created by 김승원 on 4/18/25.
//

import UIKit

final class AlertManager {
    /// 화면에 알림을 표시합니다
    /// - Parameters:
    ///   - viewController: 알림 표시 대상 UIViewcontroller 인스턴스
    ///   - title: 알림 제목
    ///   - message: 알림 내용입니다 기본값은 nil로 빈 문자열
    ///   - isCancelButtonEnabled: 취소 버튼 표시 여부
    ///   - confirmHandler: 확인 버튼 후 실행할 클로저
    static func showAlert(
        on viewController: UIViewController,
        title: String,
        message: String? = nil,
        isCancelButtonEnabled: Bool = false,
        confirmHandler: ((UIAlertAction) -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message ?? "", preferredStyle: .alert)
            
            if isCancelButtonEnabled {
                let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
            }
            
            let confirmAction = UIAlertAction(title: "확인", style: .default, handler: confirmHandler)
            alert.addAction(confirmAction)
            
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}

