import SwiftUI

struct TaskDetailView: View {
    @ObservedObject var taskManager: TaskManager
    @Binding var task: Task?
    @State private var taskCompleted = false
    @State private var taskName = ""
    @State private var selectedPomodoroCount = 0
    @State private var selectedDate = Date()
    @State private var commentText = ""
    @State private var showDatePicker = false
    @Environment(\.presentationMode) var presentationMode
    var folderID: UUID  // 

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(iconName: "chevron.left", title: "タスクの詳細") {
                if taskManager.selectedTask != nil {
                    taskManager.updateTask(
                        taskManager.selectedTask!,
                        withName: taskName,
                        pomodoroCount: selectedPomodoroCount,
                        dueDate: selectedDate,
                        comments: commentText
                    )
                } else {
                    taskManager.addTask(name: taskName, pomodoroCount: selectedPomodoroCount, dueDate: selectedDate, comments: commentText, folderID: folderID)
                }
                taskManager.selectedTask = nil
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.bottom, 10)
            .onAppear {
                if let selectedTask = taskManager.selectedTask {
                    print("TaskDetailView loaded with selected task: \(selectedTask)")
                    taskName = selectedTask.name
                    taskCompleted = selectedTask.isCompleted
                    selectedPomodoroCount = selectedTask.pomodoroCount
                    selectedDate = selectedTask.dueDate
                    commentText = selectedTask.comments
                } else {
                    print("TaskDetailView loaded with no selected task")
                }
            }
            // Task Information Section
            HStack {
                Button(action: {
                    taskCompleted.toggle()
                }) {
                    Image(systemName: taskCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(taskCompleted ? .green : .gray)
                        .frame(width: 28, height: 28)
                }

                TextField("タスクを追加...", text: $taskName)
                    .font(.title2)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)

                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            .padding(.horizontal)

            // Pomodoro and Deadline Section
            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.green)
                        .frame(width: 24, height: 24)
                    Text("ポモドーロ")
                        .font(.custom("Roboto-Bold", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.bottom, 25)

                HStack {
                    Spacer()
                    ForEach(0..<5) { index in
                        Image(systemName: index < selectedPomodoroCount ? "clock.fill" : "clock")
                            .resizable()
                            .foregroundColor(index < selectedPomodoroCount ? .green : .gray)
                            .frame(width: 28, height: 28)
                            .padding(.horizontal, 12)
                            .onTapGesture {
                                selectedPomodoroCount = index + 1
                            }
                    }
                    Spacer()
                }
                .padding(.bottom, 30)

                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.green)
                        .frame(width: 28, height: 28)
                    Text("期限")
                        .font(.custom("Roboto-Bold", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Text(SharedDateFormatter.japaneseStyle.string(from: selectedDate))
                        .font(.custom("Roboto", size: 24))
                        .foregroundColor(.green)
                        .onTapGesture {
                            showDatePicker = true
                        }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.top, 10)

            // Comment Section with Placeholder
            ZStack(alignment: .topLeading) {
                TextEditor(text: $commentText)
                    .frame(height: 400)
                    .padding(4)
                    .cornerRadius(12)
                    .opacity(commentText.isEmpty ? 0.5 : 1)

                if commentText.isEmpty {
                    Text("コメントを追加...")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                }
            }
            .padding()

            Spacer()
        }
        .background(Color.black)
        .sheet(isPresented: $showDatePicker) {
            VStack {
                Text("期限")
                    .font(.custom("Roboto-Bold", size: 20))
                    .foregroundColor(.white)
                    .padding(.bottom, 10)

                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()

                HStack {
                    Spacer()
                    Button(action: {
                        showDatePicker = false
                    }) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.green)
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}
