import SwiftUI
import Intents

struct ListFooter: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Programmi autor: Anti").font(.footnote)
            Text("Andmebaasi koostanud: Raks, Annika, Andres, Jürmo, Reelika, Liisa Lotta, Reelika, Triinu").font(.footnote)
        }
    }
}

struct SheetView: View {
    @Binding var infoVisible: Bool
    var data: ReadData
    let appVersion = Bundle.main.releaseVersionNumberPretty
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "theatermasks").symbolRenderingMode(.palette).foregroundStyle(.foreground, .orange).font(.system(size: 42))
                List {
                    Section (footer: ListFooter()) {
                        Text("Asukohad").badge(data.inspiration.locations.count)
                        Text("Emotsioonid").badge(data.inspiration.emotions.count)
                        Text("Suhted").badge(data.inspiration.relations.count)
                        Text("Esemed").badge(data.inspiration.objects.count)
                        Text("Karakterid").badge(data.inspiration.characters.count)
                        Text("Isikuomadused").badge(data.inspiration.attributes.count)
                    }
                }.listStyle(.grouped)
            }.navigationBarTitle("Inspiraator \(appVersion)", displayMode: .inline).background(.regularMaterial)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("OK") {
                            self.infoVisible.toggle()
                        }.buttonStyle(.borderedProminent).controlSize(.large)
                    }
                }
        }
    }
}
struct ContentView: View {
    @ObservedObject var inspiration = ReadData()
    @State private var infoVisible = false

    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 14) {
                SectionView(title: "Location", content: inspiration.location)
                SectionView(title: "Emotion", content: inspiration.emotion)
                SectionView(title: "Relation", content: inspiration.relation)
                SectionView(title: "Object", content: inspiration.thing)
                SectionView(title: "Random characters with attributes", content: inspiration.randompair)
            }.toolbar {
                ToolbarItem(placement: .bottomBar) {
                    VStack {
                        Button() {
                            inspiration.newChoice()
                        } label: {
                            Text("New choice").frame(minWidth: 0, maxWidth: .infinity)
                        }.buttonStyle(.borderedProminent).controlSize(.large)
                        Spacer()
                    }
                    
                }
                ToolbarItem(placement: .navigation) {
                    VStack {
                        Button() {
                            makeDonation(symbol: "IBM")
                        } label: {
                            Text("Donate")
                        }
                        Spacer()
                    }
                    
                }
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        self.infoVisible.toggle()
                    } label: { Image(systemName: "theatermasks").symbolRenderingMode(.palette).foregroundStyle(.foreground, .orange) }
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding()
            .background(.background)
            .navigationTitle("Inspiraator")
                .sheet(isPresented: $infoVisible) {
                SheetView(infoVisible: $infoVisible, data: inspiration)
                
            }
        }.navigationViewStyle(.stack)
    }
    
    func makeDonation(symbol: String) {
            let intent = InspirationIntent()
            intent.category = .emotion

            let interaction = INInteraction(intent: intent, response: nil)
       
            interaction.donate { (error) in
                if error != nil {
                    if let error = error as NSError? {
                        print(
                         "Donation failed: %@" + error.localizedDescription)
                    }
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    
    
}

struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
             .environment(\.locale, .init(identifier: "et"))
     }
 }
