import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content area
            TabView(selection: $selection) {
                TimerView(timerManager: TimerManager())
                    .tabItem {
                        Image(systemName: "clock")
                    }
                    .tag(0)

                ListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }
                    .tag(1)

                CalendarView()
                    .tabItem {
                        Image(systemName: "calendar")
                    }
                    .tag(2)

                ChartView()
                    .tabItem {
                        Image(systemName: "chart.bar")
                    }
                    .tag(3)
            }
            .accentColor(.green)
            .onAppear {
                UITabBar.appearance().unselectedItemTintColor = UIColor.gray
                UITabBar.appearance().backgroundColor = UIColor.black
            }

            // Custom Footer
            VStack(spacing: 0) {
                Divider()
                    .frame(height: 2)
                    .background(Color.green)

                HStack {
                    Button(action: { self.selection = 0 }) {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(selection == 0 ? Color.green : Color.gray)
                    }
                    Spacer()
                    Button(action: { self.selection = 1 }) {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(selection == 1 ? Color.green : Color.gray)
                    }
                    Spacer()
                    Button(action: { self.selection = 2 }) {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(selection == 2 ? Color.green : Color.gray)
                    }
                    Spacer()
                    Button(action: { self.selection = 3 }) {
                        Image(systemName: "chart.bar")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(selection == 3 ? Color.green : Color.gray)
                    }
                }
                .padding()
                .background(Color.black)
            }
            .frame(height: 60)
        }
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
