import SwiftUI

struct CalendarView: View {
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
                        VStack(alignment: .leading) {
                            ForEach(6..<24) { hour in
                                HStack {
                                    Text("\(hour):00")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color.gray)

                                    Rectangle()
                                        .fill(Color.green)
                                        .frame(height: 1)
                                        .padding(.leading, 8)

                                    Spacer()
                                }
                                .padding(.vertical, 24)
                            }
                        }
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.black) // 背景色の設定

                // 右側のフォルダ選択画面
                FolderSelectionView()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .padding(.top)
                    // 背景色の設定
            }
        }
        .background(Color.black) // 背景色
    }
}

// TaskCardViewの定義は省略

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
