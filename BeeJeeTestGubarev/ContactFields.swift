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
        newField.value = name.firstName
        fields.append(newField)

        newField = Field("Last Name")
        newField.value = name.lastName ?? ""
        fields.append(newField)

        newField = Field("Phone")
        if let phone = phoneNumber {
            newField.value = String(phone)
        } else {
            newField.value = ""
        }
        fields.append(newField)
        
        newField = Field("Zip")
        newField.value = address.zipCode ?? ""
        fields.append(newField)

        newField = Field("City")
        newField.value = address.city ?? ""
        fields.append(newField)

        newField = Field("Address")
        newField.value = address.streetAddress1 ?? ""
        
        if let address2 = address.streetAddress2 {
            newField.value += ("\n" + address2)
        }
        
        fields.append(newField)

        return fields
        
    }
    
}
