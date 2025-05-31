//
//  HomeView.swift
//  TVING_SwiftUI
//
//  Created by 김승원 on 5/31/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - body
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            titleSection
            
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
}

#Preview {
    HomeView()
}
