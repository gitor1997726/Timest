import SwiftUI

struct ListView: View {
    @State private var showAddFolderModal = false
    @State private var folders: [String] = []

    var body: some View {
        ZStack {
            VStack {
                // ヘッダー
                HeaderView(iconName: "list.bullet", title: "List")
                // フォルダリスト
                List {
                    ForEach(folders, id: \.self) { folder in
                        FolderItemView(folderName: folder)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    deleteFolder(folder)
                                } label: {
                                    Label("", systemImage: "trash")
                                        .padding(.vertical, 15) // 上下のパディングを設定
                                }
                                .tint(.green) // ゴミ箱アイコンを白色にする
                            }
//                            .frame(height: 60) // アイテムの高さを設定
                    }
                }
                .listStyle(PlainListStyle()) // リストスタイルをシンプルに設定
                .background(Color.black) // リスト全体の背景色を黒に設定

                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    AddFolderButtonView(showAddFolderModal: $showAddFolderModal)
                        .padding(.bottom, 20)
                        .padding(.trailing, 20)
                }
            }
        }
        .background(Color.black)
        .fullScreenCover(isPresented: $showAddFolderModal) {
            AddFolderModalView(isPresented: $showAddFolderModal, folders: $folders)
        }
    }

    private func deleteFolder(_ folder: String) {
        if let index = folders.firstIndex(of: folder) {
            folders.remove(at: index)
        }
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
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
        }
        .padding()
        .background(Color.secondary)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondary, lineWidth: 1) // ボーダーの色を設定
        )
//        .frame(height: 60) // アイテムの高さを設定
    }
}
