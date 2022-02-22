//
//  IntentHandler.swift
//  Inspiraator
//
//  Created by Anti on 20.02.2022.
//

import Intents

// The intents you wish to handle must be declared in the extension's Info.plist.

class IntentHandler: INExtension, InspirationIntentHandling {
    
    var inspiration:InspirationReader
    
    override init() {
        inspiration = InspirationReader()
        super.init()
    }
    
    // what do I need this resolve category for, eh?
    func resolveCategory(for intent: InspirationIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        completion(INStringResolutionResult.success(with:"ok-ok"))
    }
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        print("Inside intent handler!", intent.description)
        return self
    }
    
    func handle(intent: InspirationIntent, completion: @escaping (InspirationIntentResponse) -> Void) {
        print("Handling InspirationIntent")
        
        inspiration.newChoice()
        
        let userActivity = NSUserActivity(activityType: NSStringFromClass(InspirationIntent.self))
        let response = InspirationIntentResponse(code: .success, userActivity: userActivity)
        
        switch intent.category {
        case .emotion:
            response.result = inspiration.emotion
        case .location:
            response.result = inspiration.location
        default:
            response.result = inspiration.location
            
        }
        
        completion(response)
    }

}
