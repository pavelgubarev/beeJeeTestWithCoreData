//
//  Model.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

enum EditFormMode {
    case add
    case edit
}


class Model {
    
    private let initialJSONFile = "initialContacts"
    
    public var contacts = [Contact]()
    
    public var currentContact : Int = 0
    
    public var newContact : Contact?
    
    public var editFormMode : EditFormMode = .add
    
    func createNewContact() {
        
        var ids = [Int]()
        
        for contact in contacts {
            ids.append(contact.id)
        }
        
        let nextID = ids.max()!
        
        newContact = Contact.makeNew(withId : nextID)
        
    }
    
    func appendNewContact() {
        contacts.append(newContact!)
    }
    
    func dropNewContact() {
        newContact = nil
    }
    
    func loadInitialJSON() {
        
        if let path = Bundle.main.path(forResource: initialJSONFile, ofType: "json") {
            do {
                
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:Any]]
                
                for oneContact in json! {
                    if let oneContact = Contact(json: oneContact) {
                        contacts.append(oneContact)
                    }
                }
                            
                
            } catch {
                print(error)
            }
        } else {
            print("Неправильно задан файл с контактами")
        }
        
    }
    
}
