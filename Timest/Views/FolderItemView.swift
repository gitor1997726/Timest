// FolderItemView.swift
import SwiftUI

struct FolderItemView: View {
    var folderName: String

    var body: some View {
        HStack {
            Image(systemName: "folder")
                .resizable()
                .foregroundColor(.green)
                .frame(width: 32, height: 32)
            Spacer()
            Text(folderName)
                .foregroundColor(.white)
                .frame(width: 200, alignment: .leading)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
        }
        .padding()
        .background(Color.black)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.green, lineWidth: 2)
        )
    }
}

struct FolderItemView_Previews: PreviewProvider {
    static var previews: some View {
        FolderItemView(folderName: "Sample Folder")
            .previewLayout(.sizeThatFits)
            .background(Color.black)
    }
}
