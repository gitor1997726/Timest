import SwiftUI

struct TaskDetailView: View {
    @State private var taskCompleted = false
    @State private var selection = 1
    @State private var commentText = ""
    @State private var isEditing = false
    @State private var taskName = ""
    @State private var selectedPomodoroCount = 0 // ポモドーロ数の選択状態を追加
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    @State private var originalDate = Date() // 追加する状態変数

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HeaderView(iconName: "chevron.left", title: "")
                .padding(.bottom, 10)

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
                    Spacer() // 左側にスペースを追加
                    ForEach(0..<5) { index in
                        Image(systemName: index < selectedPomodoroCount ? "clock.fill" : "clock")
                            .resizable()
                            .foregroundColor(index < selectedPomodoroCount ? .green : .gray)
                            .frame(width: 28, height: 28)
                            .padding(.horizontal, 12) // アイコン間のスペースを確保
                            .onTapGesture {
                                selectedPomodoroCount = index + 1
                            }
                    }
                    Spacer() // 右側にスペースを追加
                }
                .padding(.bottom, 30) // アイコンと期限セクションの間のスペースを確保

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
                            originalDate = selectedDate // 現在の選択日付を保存
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
                    .onTapGesture {
                        isEditing = true
                    }

                if commentText.isEmpty && !isEditing {
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
                        selectedDate = originalDate // 元の日付に戻す
                        showDatePicker = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                    }
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
        .withFooter(selection: $selection)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView()
            .previewLayout(.sizeThatFits)
            .background(Color.black)
    }
}
