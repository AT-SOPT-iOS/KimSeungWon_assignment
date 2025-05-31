//
//  MainView.swift
//  TVING_SwiftUI
//
//  Created by 김승원 on 5/31/25.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    
    @State private var selectedFilter: Filters = .home
    @Namespace private var animation
    
    // MARK: - body
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            titleSection
            
            filterSection
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(Filters.allCases, id: \.self) { filter in
                            filter.filterContentView
                                .frame(width: 375)
                        }
                    }
                }
                .onChange(of: selectedFilter) { _, newValue in
                    withAnimation(.easeInOut) {
                        proxy.scrollTo(newValue, anchor: .center)
                    }
                }
            }
            
            Spacer()
        }
        .background(.coreBlack)
    }
    
    // MARK: - Subviews
    
    var titleSection: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(.tvingTitle)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 191, height: 78)
            
            Spacer()
            
            Button {
                print("검색 버튼")
            } label: {
                Image(.magnifyingGlass)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
            .buttonStyle(.plain)
            
            Button {
                print("프로필 버튼")
            } label: {
                Image(.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
            .buttonStyle(.plain)
            .padding(.leading, 10)
            
        }
        .padding(.trailing, 10)
    }
    
    var filterSection: some View {
        HStack(alignment: .center, spacing: 00) {
            ForEach(Filters.allCases, id: \.self) { filter in
                VStack(alignment: .center, spacing: 9) {
                    Button {
                        selectedFilter = filter
                    } label: {
                        Text(filter.title)
                            .font(.callout)
                            .foregroundStyle(.coreWhite)
                            .fixedSize()
                    }
                    .buttonStyle(.plain)
                    
                    if filter == selectedFilter {
                        Color.coreWhite
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "underLine", in: animation.self)
                    } else {
                        Color.clear
                            .frame(height: 3)
                    }
                }
            }
        }
        .padding(.bottom, 7)
        .animation(.easeInOut(duration: 0.2), value: selectedFilter)
    }
    
    var mainPosterSection: some View {
        Image(.poster1)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: 400)
            .clipped()
    }
}

extension MainView {
    enum Filters: CaseIterable, Hashable {
        case home
        case drama
        case entertainment
        case movie
        case sports
        case news
        
        var title: String {
            switch self {
            case .home:
                return "홈"
            case .drama:
                return "드라마"
            case .entertainment:
                return "예능"
            case .movie:
                return "영화"
            case .sports:
                return "스포츠"
            case .news:
                return "뉴스"
            }
        }
        
        @ViewBuilder
        var filterContentView: some View {
            switch self {
            case .home:
                HomeView()
            case .drama:
                Text("Drama")
                    .foregroundStyle(.coreRed)
            case .entertainment:
                Text("Entertain")
                    .foregroundStyle(.coreRed)
            case .movie:
                Text("Movie")
                    .foregroundStyle(.coreRed)
            case .sports:
                Text("Sports")
                    .foregroundStyle(.coreRed)
            case .news:
                Text("News")
                    .foregroundStyle(.coreRed)
            }
        }
    }
}

#Preview {
    MainView()
}
