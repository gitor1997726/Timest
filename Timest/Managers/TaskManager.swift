import Foundation
import Combine

struct Task: Identifiable, Codable {
    var id = UUID()
    var name: String
    var pomodoroCount: Int
    var dueDate: Date
    var comments: String
    var isCompleted: Bool = false
    var folderID: UUID  // 追加: タスクが属するフォルダのID
}

// TaskManager.swift
class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var selectedTask: Task?

    // タスクを追加するメソッド
    func addTask(name: String, pomodoroCount: Int, dueDate: Date, comments: String, folderID: UUID) {
        let newTask = Task(name: name, pomodoroCount: pomodoroCount, dueDate: dueDate, comments: comments, isCompleted: false, folderID: folderID)
        tasks.append(newTask)
    }

    // タスクを更新するメソッド
    func updateTask(_ task: Task, withName name: String, pomodoroCount: Int, dueDate: Date, comments: String) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].name = name
            tasks[index].pomodoroCount = pomodoroCount
            tasks[index].dueDate = dueDate
            tasks[index].comments = comments
        }
    }

    // タスクを削除するメソッド
    func deleteTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }

    // フォルダIDに関連するすべてのタスクを削除するメソッド
    func deleteTasks(forFolderID folderID: UUID) {
        tasks.removeAll { $0.folderID == folderID }
    }
}
