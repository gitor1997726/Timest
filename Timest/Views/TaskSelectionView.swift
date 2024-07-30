import SwiftUI

struct TaskSelectionView: View {
    let tasks = [
        ("スケジュール表作成", 3),
        ("UI作成", 2)
    ]

    var body: some View {
        VStack {
            // フォルダ選択ボタン
            Button(action: {
                // フォルダ選択のアクション
            }) {
                HStack {
                    Image(systemName: "folder")
                        .foregroundColor(Color.green)
                    Text("フォルダ")
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
                    ForEach(tasks, id: \.0) { task in
                        TaskCardView(taskName: task.0, pomodoroCount: task.1)
                    }
                    // 追加のタスクカードをここに配置
                }
                .padding()
            }

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.black) // 背景色の設定
    }
}

struct TaskCardView: View {
    var taskName: String
    var pomodoroCount: Int

    var body: some View {
        HStack {
            // ドラッグハンドル
            Image(systemName: "line.horizontal.3")
                .foregroundColor(Color.gray)

            VStack(alignment: .leading) {
                // タスク名
                Text(taskName)
                    .font(.headline)
                    .foregroundColor(.white)

                // ポモドーロアイコン
                HStack(spacing: 4) {
                    ForEach(0..<pomodoroCount, id: \.self) { _ in
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
    }
}

struct TaskSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSelectionView()
    }
}
