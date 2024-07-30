import SwiftUI

struct FolderSelectionView: View {
    let folders = ["プロジェクト1", "プロジェクト2", "プロジェクト3", "プロジェクト4"]

    var body: some View {
        VStack {
//            HStack {
//                Image(systemName: "folder")
//                    .foregroundColor(Color.green)
//                Text("フォルダ")
//                    .foregroundColor(.green)
//                    .font(.headline)
//                Spacer()
//                // Placeholder for an optional button or icon
//            }
//            .padding()
//            .background(Color.black)
//            .cornerRadius(10)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.green, lineWidth: 2)
//            )

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(folders, id: \.self) { folder in
                        HStack {
                            Image(systemName: "folder")
                                .foregroundColor(Color.green)
                            Text(folder)
                                .foregroundColor(.white)
//                            Spacer()
                        }
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 2)
                        )
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
        FolderSelectionView()
    }
}
