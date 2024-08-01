import SwiftUI

struct AddTaskButtonView: View {
    @EnvironmentObject var taskManager: TaskManager  // 環境オブジェクトとしてTaskManagerを受け取る
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
            TaskDetailView(task: $newTask, folderID: folderID)
                .environmentObject(taskManager)  // 環境オブジェクトとしてTaskManagerを渡す
        }
    }
}

struct AddTaskButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskButtonView(folderID: UUID())  // サンプルフォルダID
            .environmentObject(TaskManager())  // プレビューでTaskManagerを提供
    }
}
