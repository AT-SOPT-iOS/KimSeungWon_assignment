//
//  MovieViewController.swift
//  TVING
//
//  Created by 김승원 on 5/9/25.
//

import UIKit

final class MovieViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let rootView = MovieView()
    
    private let boxOfficeService = BoxOfficeService.shared
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func setAction() {
        rootView.searchButton.addTarget(
            self,
            action: #selector(searchButtonDidTap),
            for: .touchDown
        )
    }
}

// MARK: - Functions

extension MovieViewController {
    @objc
    private func searchButtonDidTap() {
        Task {
            do {
                let boxOfficeList = try await boxOfficeService.fetchBoxOffice(date: rootView.searchTextField.text)
                
                let boxOfficeTexts = boxOfficeList.map { "\($0.rank). \($0.title) \($0.openDate)"  }.joined(separator: "\n")
                
                print(boxOfficeTexts)
                
                rootView.boxOfficeLabel.text = boxOfficeTexts
            } catch {
                rootView.boxOfficeLabel.text = "실패하였습니다"
            }
        }
    }
}
