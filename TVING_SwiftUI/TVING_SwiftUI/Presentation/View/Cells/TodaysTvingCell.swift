//
//  TodaysTvingCell.swift
//  TVING_SwiftUI
//
//  Created by 김승원 on 5/31/25.
//

import SwiftUI

struct TodaysTvingCell: View {
    
    // MARK: - Properties
    
    var entertainmentContent: EntertainmentContent
    
    // MARK: - body
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text(entertainmentContent.ranking)
                .font(.system(size: 59, weight: .bold, design: .default))
                .foregroundStyle(.white)
            
            Image(entertainmentContent.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .frame(width: 98, height: 146)
        }
    }
}
