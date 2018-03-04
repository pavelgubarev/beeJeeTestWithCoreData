//
//  Contact.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

public struct Name {
    var firstName : String
    var lastName : String?
}

public struct Adress {
    var streetAddress1 : String?
    var streetAddress2 : String?
    var city : String?
    var zipCode : String?
}

public struct Contact {
    var id : Int
    var name : Name
    var phoneNumber : Int?
    var address : Adress    
}

extension Contact {
    static func makeNew(withId: Int) -> Contact {
        
        let address = Adress(streetAddress1: "", streetAddress2: "", city: "", zipCode: "")
        
        let name = Name(firstName: "", lastName: "")
        
        return Contact(id: withId, name: name, phoneNumber: nil, address: address)
    }
}



extension Contact {
    init?(json: [String: Any]) {
        

        guard let ID = json["ID"] as? Int else { return nil }
        
        guard let firstName = json["firstName"] as? String  else { return nil }
        
        guard let lastName = json["lastName"] as? String  else { return nil }
        
        guard let phoneNumberString = json["phoneNumber"] as? String else { return nil }
        
        guard let zipCode = json["zipCode"] as? String  else { return nil }
        
        guard let city = json["city"] as? String  else { return nil }
        
        guard let streetAddress1 = json["streetAddress1"] as? String  else { return nil }
        
        guard  let streetAddress2 = json["streetAddress2"] as? String  else { return nil }
        
        
        let phoneNumber : Int? = Int(phoneNumberString)
        
        self.id = ID
        self.name = Name(firstName: firstName, lastName: lastName)
        self.phoneNumber = phoneNumber        
        self.address = Adress(streetAddress1: streetAddress1, streetAddress2: streetAddress2, city: city, zipCode: zipCode)
    }
}
