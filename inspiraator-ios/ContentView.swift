import SwiftUI

struct ContentView: View {
    @ObservedObject var inspiration = ReadData()

    var body: some View {
        NavigationView {
                VStack (alignment: .leading, spacing: 14){
                    SectionView(title: "Asukoht", content: inspiration.location)
                    SectionView(title: "Emotsioon", content: inspiration.emotion)
                    SectionView(title: "Enam-vähem loogiline suhe", content: inspiration.relation)
                    SectionView(title: "Ese", content: inspiration.thing)
                    SectionView(title: "2 täiesti juhuslikku tegelast ja nende omadust", content: inspiration.randompair)
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: generate) {
                            Text("Uus valik").frame(width: 200, height: 48).font(.title)
                        }.buttonStyle(.borderedProminent)
                        Spacer()
                    }
                   
                }
                .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topLeading
                        )
                .padding()
                .navigationTitle("Inspiraator")
                .navigationBarTitleDisplayMode(.inline)
                
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func generate() {
        inspiration.newChoice();
    }
}
