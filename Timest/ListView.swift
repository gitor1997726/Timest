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
                                        /*.padding(.vertical, 15)*/ // 上下のパディングを設定
                                }
                                .tint(.black) //
                            }

                    }
                }
                .listStyle(PlainListStyle()) // リストスタイルをシンプルに設定（＊大事）
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
                .resizable()
                .foregroundColor(.green)
                .frame(width: 32, height: 32)
            Spacer()
            Text(folderName)
                .foregroundColor(.white)
                .frame(width: 200, alignment: .leading)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
        }
        .padding()
        .background(Color.black)
        .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.green, lineWidth: 2) // ボーダーの色を設定
                )


    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .previewLayout(.device)
            .preferredColorScheme(.dark)
    }
}

struct FolderItemView_Previews: PreviewProvider {
    static var previews: some View {
        FolderItemView(folderName: "Sample Folder")
            .previewLayout(.sizeThatFits)
            .background(Color.black)
    }
}
