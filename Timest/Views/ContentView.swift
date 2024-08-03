import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @EnvironmentObject var folderManager: FolderManager  // 環境オブジェクトとして受け取る

    @EnvironmentObject var taskManager: TaskManager 

    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content area
            TabView(selection: $selection) {
                TimerView(timerManager: TimerManager())
                    .tag(0)

                ListView()
                    .environmentObject(folderManager)  // FolderManagerを渡す
                    .tag(1)

                CalendarView()
                    .tag(2)

                ChartView()
                    .tag(3)
            }
        }
        .background(Color.black)
        .withFooter(selection: $selection) // カスタムフッターを適用
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FolderManager())  // プレビュー用に提供
            .environmentObject(TaskManager())    // プレビュー用に提供
    }
}
