import SwiftUI

struct FolderDetailView: View {
    var folderName: String
    @State private var tasks: [Task] = [
        Task(name: "UIの作成", isCompleted: false, pomodoros: 3, deadline: Date()),
        Task(name: "スケジュール表の作成", isCompleted: true, pomodoros: 5, deadline: Date().addingTimeInterval(86400 * 2))
    ]
    @State private var selection = 1  // フッターの選択状態を管理するための状態

    var body: some View {
        ZStack {
            VStack {
                HeaderView(iconName: "chevron.left", title: folderName)

                List {
                    ForEach(tasks) { task in
                        TaskItemView(task: task)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    deleteTask(task)
                                } label: {
                                    Label("", systemImage: "trash")

                                }
                                .tint(.black)
                            }
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.black)

                Spacer()
            }
            .background(Color.black)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    AddTaskButtonView()
                        .padding(.bottom, 20)
                        .padding(.trailing, 20)
                }
            }
        }
        .background(Color.black)
        .withFooter(selection: $selection)  // フッター修飾子を適用
    }

    private func deleteTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
}

struct TaskItemView: View {
    var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .resizable()                .foregroundColor(.green)
                .frame(width: 20, height: 20)
            VStack(alignment: .leading) {
                Text(task.name)
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: "clock")
                    Text("ｘ\(task.pomodoros)")
                    Spacer()
                    Image(systemName: "calendar")
                    Text(task.deadline, style: .date)
                }
                .foregroundColor(.green)
            }
            Spacer()
            Button(action: {
                // タスク編集画面に遷移
            }) {
                Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
            }
        }
        .padding()
        .background(Color.secondary)
        .cornerRadius(8)

    }
}

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var isCompleted: Bool
    var pomodoros: Int
    var deadline: Date
}

struct FolderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FolderDetailView(folderName: "Folder")
    }
}
