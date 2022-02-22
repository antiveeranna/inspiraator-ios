//
//  InspirationReader.swift
//  inspiraator-ios
//
//  Created by Anti on 21.02.2022.
//

import Foundation

struct InspirationHolder: Codable, Hashable {
    var locations: Array<String> = [];
    var relations: Array<String> = [];
    var attributes: Array<String> = [];
    var characters: Array<String> = [];
    var objects: Array<String> = [];
    var emotions: Array<String> = [];
}

class InspirationReader  {
    
    var location = ""
    var relation = ""
    var emotion = ""
    var randompair = ""
    var thing = ""
    
    var locations = 0
    
    var locationIndex = 0;
    var relationIndex = 0;
    var attributeIndex = 0;
    var characterIndex = 0;
    var emotionIndex = 0;
    var thingIndex = 0;
    
    var inspiration = InspirationHolder();

    init(){
        loadData()
    }
    
    func generateRandomPair () -> String {
        
        let attr1 = inspiration.attributes.randomElement() ?? ""
        let attr2 = inspiration.attributes.randomElement() ?? ""
        
        let char1 = inspiration.characters[characterIndex % inspiration.characters.count]
        characterIndex += 1

        let char2 = inspiration.characters[characterIndex % inspiration.characters.count]
        characterIndex += 1
        
        return attr1 + " " + char1 + " ja " + attr2 + " " + char2;
    }
    
    func loadData()  {
        
        print("InspirationReader Reading JSON");
                guard let url = Bundle.main.url(forResource: "inspiratsioon.json", withExtension: nil)
        else {
            print("JSON file not found")
            return
        }
        print("Completed reading")
        do {
            let data = try Data(contentsOf: url)
            let input = try JSONDecoder().decode(InspirationHolder.self, from: data)
            inspiration = input
            
            // shuffle data, so new choices will be unique, until exhausted
            inspiration.locations.shuffle()
            inspiration.relations.shuffle()
            inspiration.attributes.shuffle()
            inspiration.characters.shuffle()
            inspiration.objects.shuffle()
            inspiration.emotions.shuffle()
            
            location = inspiration.locations[locationIndex]
            relation = inspiration.relations[relationIndex]
            thing = inspiration.objects[thingIndex]
            emotion = inspiration.emotions[emotionIndex]
            randompair = generateRandomPair()
            
            
        } catch {
            print("Mingi jura!", error);
        }

    }
    
    func newChoice()  {
        locationIndex += 1;
        relationIndex += 1;
        attributeIndex += 1;
        thingIndex += 1;
        emotionIndex += 1

        // fetch element at given index mod length,
        // so counter starts from beginning on exhaustion
        
        location = inspiration.locations[locationIndex % inspiration.locations.count];
        relation = inspiration.relations[relationIndex % inspiration.relations.count];
        thing = inspiration.objects[thingIndex % inspiration.objects.count];
        emotion = inspiration.emotions[emotionIndex % inspiration.emotions.count];
        
        randompair = generateRandomPair()
    }
}
