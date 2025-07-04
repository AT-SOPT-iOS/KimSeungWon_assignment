//
//  TempView.swift
//  TVING_SwiftUI
//
//  Created by 김승원 on 6/1/25.
//

import SwiftUI

struct TempView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundStyle(.coreRed)
            .frame(width: 375)
    }
}
