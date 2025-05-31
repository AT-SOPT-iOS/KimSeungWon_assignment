//
//  RealTimePopularLiveCell.swift
//  TVING_SwiftUI
//
//  Created by 김승원 on 5/31/25.
//

import SwiftUI

struct RealTimePopularLiveCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            Image(.live1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .frame(width: 160, height: 80)
            
            HStack(alignment: .top, spacing: 4) {
                Text("1")
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("JTBC")
                        .font(.caption)
                        .foregroundStyle(.coreWhite)
                    Text("이혼숙려캠프 34화")
                        .font(.caption2)
                        .foregroundStyle(.grayscale2)
                    Text("27.2%")
                        .font(.caption2)
                        .foregroundStyle(.grayscale2)
                }
            }
            .padding(.leading, 10)
        }
    }
}

#Preview {
    RealTimePopularLiveCell()
}
