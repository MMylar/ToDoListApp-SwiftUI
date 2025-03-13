//
//  Task.swift
//  TODOApp_SwiftUI
//
//  Created by Mylar on 2/27/25.
//

import Foundation
import RealmSwift


class Task: Object, ObjectKeyIdentifiable {

    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var isCompleted = false


}
