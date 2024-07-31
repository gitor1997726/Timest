import SwiftUI

@main
struct TaskApp: App {
    @StateObject private var folderManager = FolderManager()
    @StateObject private var taskManager = TaskManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(folderManager)  // FolderManagerを共有
                .environmentObject(taskManager)    // TaskManagerも共有
        }
    }
}
