import SwiftUI

struct FolderSelectionView: View {
    @EnvironmentObject var folderManager: FolderManager  // FolderManagerを環境オブジェクトとして受け取る
    @EnvironmentObject var taskManager: TaskManager  // TaskManagerを環境オブジェクトとして受け取る
    @Binding var selectedFolderID: UUID?  // 選択されたフォルダのIDを保持
    @Binding var isTaskSelectionViewActive: Bool  // TaskSelectionViewの表示を制御するフラグ

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(folderManager.folders, id: \.id) { folder in
                        HStack {
                            Image(systemName: "folder")
                                .foregroundColor(Color.green)
                            Text(folder.name)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 2)
                        )
                        .onTapGesture {
                            selectedFolderID = folder.id
                            isTaskSelectionViewActive = true  // TaskSelectionViewを表示するフラグを立てる
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct FolderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FolderSelectionView(selectedFolderID: .constant(nil), isTaskSelectionViewActive: .constant(false))
            .environmentObject(FolderManager())  // プレビュー用に環境オブジェクトを設定
    }
}
