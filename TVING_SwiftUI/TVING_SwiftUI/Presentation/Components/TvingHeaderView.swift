//
//  TvingHeaderView.swift
//  TVING_SwiftUI
//
//  Created by 김승원 on 5/31/25.
//

import SwiftUI

struct TvingHeaderView: View {
    
    // MARK: - Properties
    
    var headerType: HeaderType
    
    // MARK: - body
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text(headerType.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.coreWhite)
            
            Spacer()
            
            if headerType.shouldShowMoreButton {
                Button {
                    
                } label: {
                    Text("더보기")
                        .font(.caption)
                        .foregroundStyle(.grayscale2)
                }
            }
        }
        .padding(.horizontal, 12)
    }
}

extension TvingHeaderView {
    enum HeaderType {
        case todaysTving
        case realTimePopularLive
        case realTimePopularMovie
        case masterpiece
        
        var title: String {
            switch self {
            case .todaysTving:
                return "오늘의 티빙 TOP 20"
            case .realTimePopularLive:
                return "실시간 인기 LIVE"
            case .realTimePopularMovie:
                return "실시간 인기 영화"
            case .masterpiece:
                return "김승원PD의 인생작 TOP 5"
            }
        }
        
        var shouldShowMoreButton: Bool {
            switch self {
            case .todaysTving, .masterpiece:
                return false
            case .realTimePopularLive, .realTimePopularMovie:
                return true
            }
        }
    }
}

#Preview {
    TvingHeaderView(headerType: .todaysTving)
}
