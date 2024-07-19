import SwiftUI

struct ListView: View {
    var body: some View {
        ZStack {
            VStack {
                // ヘッダー
                HeaderView(iconName: "list.bullet", title: "List")
                // フォルダリスト
                ScrollView {
                    VStack(spacing: 16) {
                        FolderItemView(folderName: "時間管理アプリの作成")
                        FolderItemView(folderName: "数学のレポート作成")
                    }
                    .padding()
                }
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    AddFolderButtonView()
                        .padding(.bottom, 20)
                        .padding(.trailing, 20)
                }
            }
        }
        .background(Color.black)
    }
}

struct FolderItemView: View {
    var folderName: String

    var body: some View {
        HStack {
            Image(systemName: "folder")
                .foregroundColor(.green)
                .frame(width: 40, height: 40)
            Text(folderName)
                .foregroundColor(.white)
                .frame(width: 200, alignment: .leading)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .frame(width: 40, height: 40)
        }
        .padding()
        .background(Color.secondary)
        .cornerRadius(8)
    }
}

struct AddFolderButtonView: View {
    var body: some View {
        Button(action: {
            // フォルダ追加のアクション
        }) {
            Image("addFolderButton")
                .resizable()
                .frame(width: 76, height: 76)
        }
        .background(Color.clear)
        .cornerRadius(38)
        .shadow(radius: 10)
    }
}
