import SwiftUI
import Foundation

struct SectionView: View {
    
    var title: String;
    var content: String;
    
    var body: some View {
        VStack (alignment: .leading){
            Text(LocalizedStringKey(title)).font(.caption).foregroundColor(.accentColor)
            Text(content.prefix(1).capitalized + content.dropFirst()).font(.title2)
        }
        Divider()
    }
}


