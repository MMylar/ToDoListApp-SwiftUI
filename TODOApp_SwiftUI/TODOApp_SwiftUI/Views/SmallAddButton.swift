//
//  SmallAddButton.swift
//  TODOApp_SwiftUI
//
//  Created by Mylar on 2/27/25.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(.blue)
            Text("+")
                .fontWeight(.heavy)
                .font(.title2)
                .foregroundColor(.white)


        }.frame(height: 50)
    }
}

#Preview {
    SmallAddButton()
}
