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
    var scheduledTime: Int?  // スケジュールされた時間を示すプロパティ（例：700は7:00、730は7:30など）
}


class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var selectedTask: Task?

    // タスクを追加するメソッド
    func addTask(name: String, pomodoroCount: Int, dueDate: Date, comments: String, folderID: UUID) {

        var newTask = Task(name: name, pomodoroCount: pomodoroCount, dueDate: dueDate, comments: comments, folderID: folderID)
        newTask.isNewTask = false  // 新規タスクではなくなったことを示す
        tasks.append(newTask)
        print("Added Task: \(newTask)")
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

    // フォルダIDに関連するタスクを取得するメソッド
    func tasks(forFolderID folderID: UUID) -> [Task] {
        return tasks.filter { $0.folderID == folderID }
    }

}
