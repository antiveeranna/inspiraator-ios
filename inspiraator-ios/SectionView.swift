import SwiftUI
import Foundation

struct SectionView: View {
    
    var title: String;
    var content: String;
    
    var body: some View {
        VStack (alignment: .leading){
            Text(title).font(.caption).foregroundColor(.blue).fontWeight(.semibold)
            Text(content.prefix(1).capitalized + content.dropFirst()).padding(.leading).font(.title2)
        }
        Divider()
    }
}


