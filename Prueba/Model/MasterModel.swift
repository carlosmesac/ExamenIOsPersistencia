//
//  MasterModel.swift
//  ExamenIOSPersitenciaFirebase
//
//  Created by alumno on 01/01/2020.
//  Copyright © 2020 alumno. All rights reserved.
//

import Foundation
import FirebaseDatabase
class MasterModel {
    var personArrayList: [PersonItem] = []
    
    
    
    func fillArray(completion: @escaping (Bool, [PersonItem]) -> Void){
        let ref = Database.database().reference().child("users")
        ref.observe(.value, with: { (snapshot) in
            
            var personArrayList1 : [PersonItem] = []
            print(snapshot.value)
            for child in snapshot.children{
                if let snapshot = child as? DataSnapshot,
                    let person = PersonItem(snapshot: snapshot){
                    personArrayList1.append(person)
                    
                    
                }
            }
            print(personArrayList1)
            self.personArrayList = personArrayList1
            completion(false,self.personArrayList)
            Constants.Values.array = self.personArrayList
                    
        })
    
    }
}
