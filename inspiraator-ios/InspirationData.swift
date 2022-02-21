
import Foundation

class ReadData: ObservableObject  {
    @Published var location = ""
    @Published var relation = ""
    @Published var emotion = ""
    @Published var randompair = ""
    @Published var thing = ""
    
    @Published var locations = 0
    
    var reader = InspirationReader()
    @Published var inspiration:InspirationHolder

    init(){
        inspiration = reader.inspiration
        newChoice()
    }
    
    func newChoice()  {
        reader.newChoice()
        location = reader.location
        relation = reader.relation
        thing = reader.thing
        emotion = reader.emotion
        randompair = reader.generateRandomPair()
    }
}
