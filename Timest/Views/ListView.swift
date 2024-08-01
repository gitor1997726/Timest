import SwiftUI

struct ListView: View {
    @State private var showAddFolderModal = false
    @EnvironmentObject var folderManager: FolderManager  // FolderManagerを環境オブジェクトとして受け取る

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // ヘッダー
                    HeaderView(iconName: "list.bullet", title: "List")

                    // フォルダリスト
                    List {
                        ForEach(folderManager.folders, id: \.id) { folder in
                            HStack {
                                FolderItemView(folderName: folder.name)
                                NavigationLink(destination: FolderDetailView(folderID: folder.id)) {
                                    EmptyView()
                                }
                                .frame(width: 0)
                                .opacity(0)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    deleteFolder(folder)
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
                AddFolderModalView(isPresented: $showAddFolderModal)
                    .environmentObject(folderManager)  // 環境オブジェクトを提供
            }
        }
        .navigationBarHidden(true) // NavigationBarを非表示に設定
    }

    private func deleteFolder(_ folder: Folder) {
        folderManager.deleteFolder(folder)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(FolderManager())  // プレビューで提供
    }
}
