import Foundation
import Combine

struct Folder: Identifiable, Codable {
    var id = UUID()
    var name: String
}

class FolderManager: ObservableObject {
    @Published var folders: [Folder] = []

    // フォルダを追加するメソッド
    func addFolder(name: String) {
        let newFolder = Folder(name: name)
        folders.append(newFolder)
    }

    // フォルダを削除するメソッド
    func deleteFolder(_ folder: Folder) {
        if let index = folders.firstIndex(where: { $0.id == folder.id }) {
            folders.remove(at: index)
        }
    }

    // すべてのフォルダを取得するメソッド
    func getAllFolders() -> [Folder] {
        return folders
    }
}
