//
//  MainViewController.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - Properties
    
    enum MainSection: CaseIterable {
        case main
    }
    
    private let rootView = MainView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRegister()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setDefaultNavigationBar()
    }
    
    override func setView() {
        rootView.collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    override func setDelegate() {
        rootView.collectionView.dataSource = self
    }
}

// MARK: - Functions

private extension MainViewController {
    func setRegister() {
        rootView.collectionView.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseIdentifier)
    }
}

// MARK: - UICollectionView CompositionalLayout

private extension MainViewController {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) in
            print(section)
            let section = MainSection.allCases[section]
            
            switch section {
            case .main:
                return self.configureMainSection()
            }
        }
    }
    
    func configureMainSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .absolute(530)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MainSection.allCases.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        switch MainSection.allCases[section] {
        case .main:
            return EntertainmentContent.mainMockData.count
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch MainSection.allCases[indexPath.section] {
        case .main:
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: MainCell.reuseIdentifier,
                for: indexPath
            ) as? MainCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(EntertainmentContent.mainMockData[indexPath.row])
            return cell
        }
    }
}
