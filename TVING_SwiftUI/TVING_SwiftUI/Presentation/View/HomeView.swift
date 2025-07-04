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
                
                realTimePopularMovieSection
                
                baseBallSection
                
                platformSection
                
                masterPieceSection
                
                footerSection
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
                    ForEach(EntertainmentContent.todaysTvingMockData, id: \.self) { data in
                        TodaysTvingCell(entertainmentContent: data)
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
                    ForEach(EntertainmentContent.liveMockData, id: \.self) { data in
                        RealTimePopularLiveCell(entertainmentContent: data)
                    }
                }
                .padding(.horizontal, 12)
            }
        }
    }
    
    var realTimePopularMovieSection: some View {
        VStack(alignment: .center, spacing: 12) {
            TvingHeaderView(headerType: .realTimePopularMovie)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: tvingRows, spacing: 8) {
                    ForEach(EntertainmentContent.movieMockData, id: \.self) { data in
                        Image(data.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .frame(width: 98, height: 146)
                    }
                }
                .padding(.horizontal, 12)
            }
        }
    }
    
    var baseBallSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(EntertainmentContent.baseballMockData.enumerated()), id: \.offset) { index, data in
                    ZStack {
                        Color(index % 2 == 0 ? .coreWhite : .coreBlack)
                            .frame(width: 80, height: 50)
                        
                        Image(data.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }
    }
    
    var platformSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 7) {
                ForEach(EntertainmentContent.platformMockData, id: \.self) { data in
                    ZStack {
                        Color.grayscale4
                            .frame(width: 90, height: 45)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                        
                        Image(data.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .frame(width: 68, height: 34)
                    }
                }
            }
            .padding(.horizontal, 12)
        }
    }
    
    var masterPieceSection: some View {
        VStack(alignment: .center, spacing: 12) {
            TvingHeaderView(headerType: .masterPiece)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: tvingRows, spacing: 8) {
                    ForEach(EntertainmentContent.bestContentsMockData, id: \.self) { data in
                        Image(data.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .frame(width: 160, height: 90)
                    }
                }
                .padding(.horizontal, 12)
            }
        }
    }
    
    var footerSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Button {
                
            } label: {
                HStack(spacing: 8) {
                    Text("공지")
                        .font(.caption)
                        .foregroundStyle(.grayscale3)
                    
                    Text("티빙 계정 공유 정책 추가 안내")
                        .font(.caption)
                        .foregroundStyle(.coreWhite)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.coreWhite)
                }
                .padding(.horizontal, 17)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.grayscale4)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .buttonStyle(.plain)
            
            Text("고객문의 · 이용약관 ·\n사업자정보 · 인재채용")
                .font(.caption)
                .foregroundStyle(.grayscale3)
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 80)
    }
}

#Preview {
    HomeView()
}
