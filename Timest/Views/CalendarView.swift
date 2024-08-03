import SwiftUI
import UniformTypeIdentifiers

struct CalendarView: View {
    @EnvironmentObject var folderManager: FolderManager  // FolderManagerを環境オブジェクトとして受け取る
    @EnvironmentObject var taskManager: TaskManager  // TaskManagerを環境オブジェクトとして受け取る
    @State private var selectedFolderID: UUID?  // 選択されたフォルダのIDを保持
    @State private var isTaskSelectionViewActive: Bool = false  // TaskSelectionViewの表示を制御するフラグ

    var body: some View {
        VStack {
            // ヘッダーの追加
            HeaderView(iconName: "calendar", title: "Calendar")

            HStack {
                // 左側のスケジュール画面
                VStack {
                    HStack {
                        Button(action: {
                            // 前の日へのアクション
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.gray)
                        }

                        Button(action: {
                            // 日付選択のアクション
                        }) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(Color.green)
                                Text("7/29(月)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }

                        Button(action: {
                            // 次の日へのアクション
                        }) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 16)

                    // 時間軸表示
                    ScrollView {
                        ZStack {
                            // 時間軸を表示するビュー
                            TimeAxisView { providers, hour, minute in
                                handleDrop(providers: providers, hour: hour, minute: minute)
                            }

                            // タスクカードを表示するビュー
                            ScheduledTaskCardsView()
                        }
                    }


                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.black) // 背景色の設定

                // 右側のフォルダ/タスク画面
                ZStack {
                    if isTaskSelectionViewActive {
                        TaskSelectionView(selectedFolderID: $selectedFolderID, isTaskSelectionViewActive: $isTaskSelectionViewActive)
                            .environmentObject(taskManager)
                            .environmentObject(folderManager)
                    } else {
                        FolderSelectionView(selectedFolderID: $selectedFolderID, isTaskSelectionViewActive: $isTaskSelectionViewActive)
                            .environmentObject(folderManager)
                            .environmentObject(taskManager)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .padding(.top)
                // 背景色の設定
            }
        }
        .background(Color.black) // 背景色
    }

    private func handleDrop(providers: [NSItemProvider], hour: Int, minute: Int) -> Bool {
        let itemProvider = providers.first { $0.canLoadObject(ofClass: NSString.self) }

        itemProvider?.loadObject(ofClass: NSString.self, completionHandler: { (object, error) in
            if let taskData = object as? String {
                let components = taskData.split(separator: "|")
                guard components.count == 3 else { return }

                let taskID = UUID(uuidString: String(components[0])) ?? UUID()
                _ = String(components[1])
                _ = Int(components[2]) ?? 0

                DispatchQueue.main.async {
                    if let index = taskManager.tasks.firstIndex(where: { $0.id == taskID }) {
                        taskManager.tasks[index].scheduledTime = hour * 100 + minute
                    }
                }
            }
        })

        return true
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(FolderManager())  // プレビュー用に提供
            .environmentObject(TaskManager())
    }
}
