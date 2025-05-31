//
//  HomeView.swift
//  TVING_SwiftUI
//
//  Created by 김승원 on 5/31/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    private let tvingRows: [GridItem] = [GridItem(.flexible(), spacing: 0)]
    
    // MARK: - body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 30) {
                mainPosterSection
                
                todaysTvingSection
                
                realTimePopularLiveSection
            }
        }
        .background(.coreBlack)
    }
    
    // MARK: - Subviews
    
    var mainPosterSection: some View {
        Image(.poster1)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: 400)
            .clipped()
    }
    
    var todaysTvingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            TvingHeaderView(headerType: .todaysTving)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: tvingRows, spacing: 20) {
                    ForEach(0..<10) { _ in
                        TodaysTvingCell()
                    }
                }
                .padding(.horizontal, 12)
            }
        }
    }
    
    var realTimePopularLiveSection: some View {
        VStack(alignment: .center, spacing: 12) {
            TvingHeaderView(headerType: .realTimePopularLive)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: tvingRows, spacing: 8) {
                    ForEach(0..<10) { _ in
                        RealTimePopularLiveCell()
                    }
                }
                .padding(.horizontal, 12)
            }
        }
    }
}

#Preview {
    HomeView()
}
