import SwiftUI

struct AddTaskButtonView: View {
    @ObservedObject var taskManager: TaskManager
    @State private var showTaskDetail = false
    @State private var newTask: Task?  // 初期化はボタンアクションで行う
    var folderID: UUID  // フォルダIDを追加

    var body: some View {
        Button(action: {
            // 新しいタスクを初期化するときにfolderIDを設定
            newTask = Task(name: "", pomodoroCount: 0, dueDate: Date(), comments: "", folderID: folderID)
            showTaskDetail = true
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 76, height: 76)
                .foregroundColor(.green)
        }
        .background(Color.clear)
        .cornerRadius(38)
        .shadow(radius: 10)
        .fullScreenCover(isPresented: $showTaskDetail) {
            TaskDetailView(taskManager: taskManager, task: $newTask, folderID: folderID)

        }
    }
}

struct AddTaskButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskButtonView(taskManager: TaskManager(), folderID: UUID())  // サンプルフォルダID
    }
}
