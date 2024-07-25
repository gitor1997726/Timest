import SwiftUI

struct ListView: View {
    @State private var showAddFolderModal = false
    @State private var folders: [String] = []

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // ヘッダー
                    HeaderView(iconName: "list.bullet", title: "List")
                    // フォルダリスト
                    List {
                        ForEach(folders, id: \.self) { folder in
                            HStack {
                                FolderItemView(folderName: folder)
                                NavigationLink(destination: FolderDetailView(folderName: folder)) {
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
                AddFolderModalView(isPresented: $showAddFolderModal, folders: $folders)
            }
        }
        .navigationBarHidden(true) // NavigationBarを非表示に設定
    }

    private func deleteFolder(_ folder: String) {
        if let index = folders.firstIndex(of: folder) {
            folders.remove(at: index)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .previewLayout(.device)
            .preferredColorScheme(.dark)
    }
}
