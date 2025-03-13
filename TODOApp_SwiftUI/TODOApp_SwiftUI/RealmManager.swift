//
//  RealmManager.swift
//  TODOApp_SwiftUI
//
//  Created by Mylar on 2/27/25.
//

import Foundation
import RealmSwift


class RealmManager: ObservableObject {


    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []

    init() {
        openRealm()
        getTasks()
    }

    func openRealm() {
        do {
            let confi = Realm.Configuration(schemaVersion: 1, migrationBlock: {migration,oldSchemaVersion in 
                if oldSchemaVersion > 1 {
//
                }
            })

            Realm.Configuration.defaultConfiguration = confi
            localRealm = try Realm()

        } catch {
            print("error loading the realm \(error)")
        }
    }




    func addTask(_taskTitle: String) {
        if let localRealm = localRealm {

            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": _taskTitle, "isCompleted": false])

                    localRealm.add(newTask)
                    getTasks()
                    print("new task added to the Realm \(newTask)")
                }
            } catch {
                print("error in adding the task \(error)")
            }

        }
    }



    func getTasks(){
        if let localRealm = localRealm{
           let allTasks = localRealm .objects(Task.self).sorted(byKeyPath: "isCompleted", ascending: true)
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }

        }
    }

    func updatedTask(_ id: ObjectId, isCompleted: Bool) {
        if let localRealm = localRealm{
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else { return }
                try localRealm.write {
                    taskToUpdate[0].isCompleted = isCompleted
                    getTasks()
                    print("updated task with id \(id)! completed status \(isCompleted)")

                }

            }catch{
                print("error in updating the task \(error)")
            }





        }

    }

    func delete(id: ObjectId) {
        if let localRealm = localRealm{
            do {
                let taskDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskDelete.isEmpty else { return }


                try localRealm.write {
                    localRealm.delete(taskDelete)
                    getTasks()
                    print("deleted task with id \(id)! completed ")

                }

            } catch {
                print("error in deleting the task \(error)")
            }







        }


    }

}
