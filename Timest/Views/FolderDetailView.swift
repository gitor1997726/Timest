import SwiftUI

struct FolderDetailView: View {
    var folderName: String
    @ObservedObject var taskManager: TaskManager
    @Environment(\.presentationMode) var presentationMode
    @State private var selection = 1
    @State private var showTaskDetailView = false
    @State private var selectedTask: Task?

    var body: some View {
        ZStack {
            VStack {
                HeaderView(iconName: "chevron.left", title: folderName) {
                    self.presentationMode.wrappedValue.dismiss()
                }
                List {
                    ForEach(taskManager.tasks) { task in
                        TaskItemView(task: task)
                            .onTapGesture {
                                selectedTask = task
                                print("Task selected: \(String(describing: selectedTask))")
                                showTaskDetailView = true
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    taskManager.deleteTask(task)
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
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    AddTaskButtonView(taskManager: taskManager)
                        .padding(.bottom, 20)
                        .padding(.trailing, 20)
                        .onTapGesture {
                            selectedTask = nil
                            showTaskDetailView = true
                        }
                }
            }
        }
        .background(Color.black)
        .fullScreenCover(isPresented: $showTaskDetailView) {
            TaskDetailView(taskManager: taskManager, task: $selectedTask)
        }
    }
}

struct TaskItemView: View {
    var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(.green)
                .frame(width: 20, height: 20)
            VStack(alignment: .leading) {
                Text(task.name)
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: "clock")
                    Text("ｘ\(task.pomodoroCount)")
                    Spacer()
                    Image(systemName: "calendar")
                    Text(task.dueDate, style: .date)
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

struct FolderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FolderDetailView(folderName: "Sample Folder", taskManager: TaskManager())
    }
}
