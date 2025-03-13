//
//  AddTaskView.swift
//  TODOApp_SwiftUI
//
//  Created by Mylar on 2/27/25.
//

import SwiftUI

struct AddTaskView: View {

    @EnvironmentObject var realmManager: RealmManager

    @State private var newTask: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a New task")
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .font(.title)

            TextField("enter your task here", text: $newTask)
                .textFieldStyle(.roundedBorder)

            Button {
                let trimmedTasks = newTask.trimmingCharacters(in: .whitespacesAndNewlines)
                if !trimmedTasks.isEmpty {
                    realmManager.addTask(_taskTitle: newTask)
                    print("task Added\(newTask)")
                }
                dismiss()
            } label: {
                Text("Add task").bold()
            }
            .frame(maxHeight: 20)
            .padding()
            .background(Color.green)
            .cornerRadius(30)
            .foregroundColor(.white)
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
    }

}

#Preview {
    AddTaskView()
        .environmentObject(RealmManager())
}
