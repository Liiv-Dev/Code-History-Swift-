//
//  BottomTextView.swift
//  Code History (Swift)
//
//  Created by Willie Jones on 4/2/24.
//

import SwiftUI

struct BottomTextView: View {
    let str: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(str)
                .font(.body)
                .bold()
                .padding()
            Spacer()
        }
        .background(GameColor.accent)
    }
}

#Preview {
    BottomTextView(str: "Test")
}
