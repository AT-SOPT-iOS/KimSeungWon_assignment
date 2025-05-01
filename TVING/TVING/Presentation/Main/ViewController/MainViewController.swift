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
        case mainPoster
        case todaysTving
        case live
        case movie
        case baseball
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
        rootView.collectionView.register(TodaysTvingCell.self, forCellWithReuseIdentifier: TodaysTvingCell.reuseIdentifier)
        rootView.collectionView.register(LiveCell.self, forCellWithReuseIdentifier: LiveCell.reuseIdentifier)
        rootView.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseIdentifier)
        rootView.collectionView.register(BaseballCell.self, forCellWithReuseIdentifier: BaseballCell.reuseIdentifier)
        
        rootView.collectionView.register(
            MainHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MainHeaderView.reuseIdentifier
        )
    }
}

// MARK: - UICollectionView CompositionalLayout

private extension MainViewController {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) in
            let section = MainSection.allCases[section]
            
            switch section {
            case .mainPoster:
                return self.configureMainSection()
            case .todaysTving:
                return self.configureTodaysTvingSection()
            case .live:
                return self.configureLiveSection()
            case .movie:
                return self.configureMovieSection()
            case .baseball:
                return self.configureBaseballSection()
            }
        }
    }
    
    func configureMainSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width),
            heightDimension: .absolute(577)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    func configureTodaysTvingSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(134),
            heightDimension: .absolute(146)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [configureHeaderView()]
        
        return section
    }
    
    func configureLiveSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(160),
            heightDimension: .absolute(134)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 7
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [configureHeaderView()]
        
        return section
    }
    
    func configureMovieSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(98),
            heightDimension: .absolute(146)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 7
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [configureHeaderView()]
        
        return section
    }
    
    func configureBaseballSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(80),
            heightDimension: .absolute(50)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 28, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    func configureHeaderView() -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(55)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: size,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -12, bottom: 0, trailing: -12)
        
        return header
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
        case .mainPoster:
            return EntertainmentContent.mainPosterMockData.count
        case .todaysTving:
            return EntertainmentContent.todaysTvingMockData.count
        case .live:
            return EntertainmentContent.liveMockData.count
        case .movie:
            return EntertainmentContent.movieMockData.count
        case .baseball:
            return EntertainmentContent.baseballMockData.count
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch MainSection.allCases[indexPath.section] {
        case .mainPoster:
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: MainCell.reuseIdentifier,
                for: indexPath
            ) as? MainCell else {
                return UICollectionViewCell()
            }
            cell.configure(EntertainmentContent.mainPosterMockData[indexPath.row])
            return cell
            
        case .todaysTving:
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: TodaysTvingCell.reuseIdentifier,
                for: indexPath
            ) as? TodaysTvingCell else {
                return UICollectionViewCell()
            }
            cell.configure(EntertainmentContent.todaysTvingMockData[indexPath.row])
            return cell
            
        case .live:
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: LiveCell.reuseIdentifier,
                for: indexPath
            ) as? LiveCell else {
                return UICollectionViewCell()
            }
            cell.configure(EntertainmentContent.liveMockData[indexPath.row])
            return cell
            
        case .movie:
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: MovieCell.reuseIdentifier,
                for: indexPath
            ) as? MovieCell else {
                return UICollectionViewCell()
            }
            cell.configure(EntertainmentContent.movieMockData[indexPath.row])
            return cell
            
        case .baseball:
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: BaseballCell.reuseIdentifier,
                for: indexPath
            ) as? BaseballCell else {
                return UICollectionViewCell()
            }
            cell.configure(EntertainmentContent.baseballMockData[indexPath.row], row: indexPath.row)
            return cell
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let headerView = rootView.collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: MainHeaderView.reuseIdentifier,
            for: indexPath
        ) as? MainHeaderView else {
            return UICollectionReusableView()
        }
        
        switch MainSection.allCases[indexPath.section] {
        case .mainPoster, .baseball:
            break
        case .todaysTving:
            headerView.configure(title: "오늘의 티빙 TOP 5")
        case .live:
            headerView.configure(title: "실시간 인기 라이브", shouldShowButton: true)
        case .movie:
            headerView.configure(title: "실시간 인기 영화" , shouldShowButton: true)
        }
        
        return headerView
    }
}
