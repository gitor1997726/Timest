import SwiftUI

struct TaskSelectionView: View {
    @EnvironmentObject var taskManager: TaskManager
    @EnvironmentObject var folderManager: FolderManager
    @Binding var selectedFolderID: UUID?  // FolderSelectionViewから渡されるフォルダID
    @Binding var isTaskSelectionViewActive: Bool  // TaskSelectionViewの表示を制御するフラグ

    var body: some View {
        VStack {
            // フォルダ選択ボタン（戻るボタン）
            Button(action: {
                isTaskSelectionViewActive = false  // フォルダ選択画面に戻る
            }) {
                HStack {
                    Image(systemName: "folder")
                        .foregroundColor(Color.green)
                    Text(folderName)  // フォルダの名前を表示
                        .font(.headline)
                        .foregroundColor(.white)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 2)
                )
            }
            .padding(.top, 16)

            // タスクカードの表示エリア
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(taskManager.tasks(forFolderID: selectedFolderID ?? UUID()), id: \.id) { task in
                        TaskCardView(task: task)  // タスクオブジェクト全体を渡す
                    }
                }
                .padding()
            }

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.black) // 背景色の設定
    }

    // フォルダの名前を取得する
    var folderName: String {
        if let folderID = selectedFolderID,
           let folder = folderManager.folders.first(where: { $0.id == folderID }) {
            return folder.name
        }
        return "フォルダ"
    }
}

struct TaskCardView: View {
    var task: Task

    var body: some View {
        HStack {
            // ドラッグハンドル
            Image(systemName: "line.horizontal.3")
                .foregroundColor(Color.gray)

            VStack(alignment: .leading) {
                // タスク名
                Text(task.name)
                    .font(.headline)
                    .foregroundColor(.white)

                // ポモドーロアイコン
                HStack(spacing: 4) {
                    ForEach(0..<task.pomodoroCount, id: \.self) { _ in
                        Image(systemName: "clock")
                            .foregroundColor(Color.green)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.black)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.green, lineWidth: 2)
        )
        .onDrag {
            // ドラッグジェスチャーの開始時にタスク情報をペイロードとして提供
            let taskData = "\(task.id)|\(task.name)|\(task.pomodoroCount)"
            return NSItemProvider(object: taskData as NSString)
        }
    }
}

struct TaskSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSelectionView(selectedFolderID: .constant(nil), isTaskSelectionViewActive: .constant(true))
            .environmentObject(TaskManager())  // プレビュー用にTaskManagerを設定
            .environmentObject(FolderManager())  // プレビュー用にFolderManagerを設定
    }
}
