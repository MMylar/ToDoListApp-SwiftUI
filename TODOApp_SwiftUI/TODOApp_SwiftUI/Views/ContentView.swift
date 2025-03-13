//
//  ContentView.swift
//  TODOApp_SwiftUI
//
//  Created by Mylar on 2/27/25.
//

import SwiftUI

struct ContentView: View {

    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView: Bool = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {

            TaskView()
                .environmentObject(realmManager)

            SmallAddButton().padding().onTapGesture {
                showAddTaskView.toggle()
            }
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(realmManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color.clear)
    }
}

#Preview {
    ContentView()
}
