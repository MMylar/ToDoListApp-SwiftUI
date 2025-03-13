//
//  TaskView.swift
//  TODOApp_SwiftUI
//
//  Created by Mylar on 2/27/25.
//

import SwiftUI

struct TaskView: View {

    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            Text("My Tasks").bold()
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity,alignment: .leading)

//            Spacer()

            List {
                ForEach(realmManager.tasks, id: \.id) { task in
                    TaskRow(task: task.title, isCompleted: task.isCompleted)
                        .onTapGesture {
                            realmManager.updatedTask(task.id,isCompleted: !task.isCompleted)
                        }.swipeActions {
                            Button("Delete", role: .destructive) {
                                realmManager.delete(id: task.id)
                                          print("Task deleted!")
                                      }
                        }
                }
                .listRowSeparator(.hidden)
            }.background(Color(.lightGray))
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.lightGray
            }
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.clear))


    }
}

#Preview {
    TaskView()
        .environmentObject(RealmManager())
}
