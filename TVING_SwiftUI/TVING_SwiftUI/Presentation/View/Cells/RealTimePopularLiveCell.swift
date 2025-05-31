//
//  RealTimePopularLiveCell.swift
//  TVING_SwiftUI
//
//  Created by 김승원 on 5/31/25.
//

import SwiftUI

struct RealTimePopularLiveCell: View {
    
    // MARK: - Properties
    
    var entertainmentContent: EntertainmentContent
    
    // MARK: - body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            Image(entertainmentContent.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .frame(width: 160, height: 80)
            
            HStack(alignment: .top, spacing: 4) {
                Text(entertainmentContent.ranking)
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(entertainmentContent.title)
                        .font(.caption)
                        .foregroundStyle(.coreWhite)
                    Text(entertainmentContent.episode)
                        .font(.caption2)
                        .foregroundStyle(.grayscale2)
                    Text(entertainmentContent.rating)
                        .font(.caption2)
                        .foregroundStyle(.grayscale2)
                }
            }
            .padding(.leading, 10)
        }
    }
}
