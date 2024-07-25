import SwiftUI

struct AddTaskButtonView: View {
    @State private var showTaskDetail = false

    var body: some View {
        Button(action: {
            showTaskDetail = true
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 76, height: 76)
                .foregroundColor(.green)
        }
        .background(Color.clear)
        .cornerRadius(38)
        .shadow(radius: 10)
        .fullScreenCover(isPresented: $showTaskDetail) {
            TaskDetailView()
        }
    }
}

struct AddTaskButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskButtonView()
    }
}
