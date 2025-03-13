//
//  TaskRow.swift
//  TODOApp_SwiftUI
//
//  Created by Mylar on 2/27/25.
//

import SwiftUI

struct TaskRow: View {

    var task: String
    var isCompleted: Bool
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "checkmark.circle.badge.xmark")
            Text(task)
        }

    }
}

#Preview {
    TaskRow(task: "Do laundry", isCompleted: true)
}
