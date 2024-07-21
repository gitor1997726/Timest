import SwiftUI

struct AddFolderButtonView: View {
    @Binding var showAddFolderModal: Bool

    var body: some View {
        Button(action: {
            showAddFolderModal = true
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 76, height: 76)
                .foregroundColor(.green)
        }
        .background(Color.clear)
        .cornerRadius(38)
        .shadow(radius: 10)
    }
}
