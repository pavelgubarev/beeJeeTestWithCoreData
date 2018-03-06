//
//  ContactFields.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

class Field {
    var name : String = ""
    var value : String = ""
    
    init(_ withName : String) {
        name = withName
        value = ""
    }
}

extension Contact {
    
    func printableContactsWithLabels() -> [Field] {
        
        var fields = [Field]()
        
        var newField = Field("Name")
        newField.value = firstName!
        fields.append(newField)

        newField = Field("Last Name")
        newField.value = lastName ?? ""
        fields.append(newField)

        newField = Field("Phone")
            newField.value = String(phoneNumber)
        fields.append(newField)
        
        newField = Field("Zip")
        newField.value = zipCode ?? ""
        fields.append(newField)

        newField = Field("City")
        newField.value = city ?? ""
        fields.append(newField)

        newField = Field("Address")
        newField.value = streetAddress1 ?? ""
        
        if let address2 = streetAddress2 {
            newField.value += ("\n" + address2)
        }
        
        fields.append(newField)

        return fields
        
    }
    
}
