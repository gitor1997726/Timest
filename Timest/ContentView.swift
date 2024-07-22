import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content area
            TabView(selection: $selection) {

                //現在のコードでは、TimerViewが表示されるたびに新しいTimerManagerインスタンスが作成されます。そのため、他の画面（例えばリストビュー）に移った後、再びTimerViewに戻ると、タイマーはリセットされます。
                TimerView(timerManager: TimerManager())
                    .tag(0)

                ListView()
                    .tag(1)

                CalendarView()
                    .tag(2)

                ChartView()
                    .tag(3)
            }
            //
//            .onAppear {
//                UITabBar.appearance().unselectedItemTintColor = UIColor.gray
//                UITabBar.appearance().backgroundColor = UIColor.black
//            }
        }
        .background(Color.black)
        .withFooter(selection: $selection) // カスタムフッターを適用
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
