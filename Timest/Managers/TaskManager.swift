import Foundation
import Combine

struct Task: Identifiable, Codable {
    var id = UUID()
    var name: String
    var pomodoroCount: Int
    var dueDate: Date
    var comments: String
    var isCompleted: Bool = false
    var folderID: UUID
    var isNewTask: Bool = true  // 新規タスクかどうかを示すフラグ
}

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var selectedTask: Task?

    // タスクを追加するメソッド
    func addTask(name: String, pomodoroCount: Int, dueDate: Date, comments: String, folderID: UUID) {
        print("addTaskが呼ばれました")
        print("タスク名: \(name), ポモドーロ数: \(pomodoroCount), 期限: \(dueDate), コメント: \(comments), フォルダID: \(folderID)")
        var newTask = Task(name: name, pomodoroCount: pomodoroCount, dueDate: dueDate, comments: comments, folderID: folderID)
        newTask.isNewTask = false  // 新規タスクではなくなったことを示す
        tasks.append(newTask)
        print("Added Task: \(newTask)")
    }

    // タスクを更新するメソッド
    func updateTask(_ task: Task, withName name: String, pomodoroCount: Int, dueDate: Date, comments: String) {
        print("updateTaskが呼ばれました")
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
