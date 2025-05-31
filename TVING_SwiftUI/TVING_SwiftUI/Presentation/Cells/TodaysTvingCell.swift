//
//  TodaysTvingCell.swift
//  TVING_SwiftUI
//
//  Created by 김승원 on 5/31/25.
//

import SwiftUI

struct TodaysTvingCell: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text("1")
                .font(.system(size: 59, weight: .bold, design: .default))
                .foregroundStyle(.white)
            
            Image(.poster1)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .frame(width: 98, height: 146)
        }
    }
}

#Preview {
    TodaysTvingCell()
}
