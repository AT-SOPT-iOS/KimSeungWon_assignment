//
//  MainViewController.swift
//  TVING
//
//  Created by 김승원 on 5/1/25.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - Properties
    
    enum MainSection {
        case mainPoster([EntertainmentContent])
        case todaysTving([EntertainmentContent])
        case live([EntertainmentContent])
        case movie([EntertainmentContent])
        case baseball([EntertainmentContent])
        case platform([EntertainmentContent])
        case bestContents([EntertainmentContent])
    }
    
    private let mainMockData: [MainSection] = [
        .mainPoster(EntertainmentContent.mainPosterMockData),
        .todaysTving(EntertainmentContent.todaysTvingMockData),
        .live(EntertainmentContent.liveMockData),
        .movie(EntertainmentContent.movieMockData),
        .baseball(EntertainmentContent.baseballMockData),
        .platform(EntertainmentContent.platformMockData),
        .bestContents(EntertainmentContent.bestContentsMockData)
    ]
    
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
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func setAction() {
        rootView.magnifyingGlassButton.addTarget(
            self,
            action: #selector(magnifyingGlassButtonDidTap),
            for: .touchUpInside
        )
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
        
        rootView.collectionView.register(PlatformCell.self, forCellWithReuseIdentifier: PlatformCell.reuseIdentifier)
        
        rootView.collectionView.register(BestContentsCell.self, forCellWithReuseIdentifier: BestContentsCell.reuseIdentifier)
        
        rootView.collectionView.register(
            MainHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MainHeaderView.reuseIdentifier
        )
        
        rootView.collectionView.register(
            MainFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: MainFooterView.reuseIdentifier
        )
    }
    
    @objc func magnifyingGlassButtonDidTap() {
        let viewController = MovieViewController()
        viewController.modalPresentationStyle = .formSheet
        self.present(viewController, animated: true)
    }
}

// MARK: - UICollectionView CompositionalLayout

private extension MainViewController {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) in
            let section = self.mainMockData[section]
            
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
            case .platform:
                return self.configurePlatformSection()
            case .bestContents:
                return self.configureBestSection()
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
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
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
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
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
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
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
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    func configurePlatformSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(90),
            heightDimension: .absolute(45)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 28, leading: 12, bottom: 0, trailing: 12)
        section.interGroupSpacing = 7
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    func configureBestSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(160),
            heightDimension: .absolute(90)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        section.interGroupSpacing = 7
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.boundarySupplementaryItems = [configureHeaderView(), configureFooterView()]
        
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
    
    func configureFooterView() -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(190)
        )
        
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: size,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        
        return footer
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mainMockData.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        switch mainMockData[section] {
        case .mainPoster(let mockData):
            return mockData.count
        case .todaysTving(let mockData):
            return mockData.count
        case .live(let mockData):
            return mockData.count
        case .movie(let mockData):
            return mockData.count
        case .baseball(let mockData):
            return mockData.count
        case .platform(let mockData):
            return mockData.count
        case .bestContents(let mockData):
            return mockData.count
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        switch mainMockData[indexPath.section] {
        case .mainPoster(let mockData):
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: MainCell.reuseIdentifier,
                for: indexPath
            ) as? MainCell else {
                return UICollectionViewCell()
            }
            cell.configure(mockData[indexPath.row])
            return cell
            
        case .todaysTving(let mockData):
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: TodaysTvingCell.reuseIdentifier,
                for: indexPath
            ) as? TodaysTvingCell else {
                return UICollectionViewCell()
            }
            cell.configure(mockData[indexPath.row])
            return cell
            
        case .live(let mockData):
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: LiveCell.reuseIdentifier,
                for: indexPath
            ) as? LiveCell else {
                return UICollectionViewCell()
            }
            cell.configure(mockData[indexPath.row])
            return cell
            
        case .movie(let mockData):
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: MovieCell.reuseIdentifier,
                for: indexPath
            ) as? MovieCell else {
                return UICollectionViewCell()
            }
            cell.configure(mockData[indexPath.row])
            return cell
            
        case .baseball(let mockData):
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: BaseballCell.reuseIdentifier,
                for: indexPath
            ) as? BaseballCell else {
                return UICollectionViewCell()
            }
            cell.configure(mockData[indexPath.row], row: indexPath.row)
            return cell
            
        case .platform(let mockData):
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: PlatformCell.reuseIdentifier,
                for: indexPath
            ) as? PlatformCell else {
                return UICollectionViewCell()
            }
            cell.configure(mockData[indexPath.row])
            return cell
            
        case .bestContents(let mockData):
            guard let cell = rootView.collectionView.dequeueReusableCell(
                withReuseIdentifier: BestContentsCell.reuseIdentifier,
                for: indexPath
            ) as? BestContentsCell else {
                return UICollectionViewCell()
            }
            cell.configure(mockData[indexPath.row])
            return cell
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: MainHeaderView.reuseIdentifier,
                for: indexPath
            ) as? MainHeaderView else {
                return UICollectionReusableView()
            }
            
            switch mainMockData[indexPath.section] {
            case .mainPoster, .baseball, .platform:
                break
            case .todaysTving:
                headerView.configure(title: "오늘의 티빙 TOP 5")
            case .live:
                headerView.configure(title: "실시간 인기 라이브", shouldShowButton: true)
            case .movie:
                headerView.configure(title: "실시간 인기 영화", shouldShowButton: true)
            case .bestContents:
                headerView.configure(title: "김승원PD의 인생작 TOP 5")
            }
            
            return headerView
        }
        
        if kind == UICollectionView.elementKindSectionFooter {
            guard let footerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: MainFooterView.reuseIdentifier,
                for: indexPath
            ) as? MainFooterView else {
                return UICollectionReusableView()
            }
            return footerView
        }
        
        return UICollectionReusableView()
    }
}
