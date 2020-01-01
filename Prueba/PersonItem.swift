//
//  Person.swift
//  ExamenIOSPersitenciaFirebase
//
//  Created by alumno on 01/01/2020.
//  Copyright © 2020 alumno. All rights reserved.
//
import Foundation
import Firebase
import FirebaseDatabase
struct PersonItem {
    
    let ref: DatabaseReference?
    let name:String
    let surname:String
    let dni:String
    let age:String
    let job:String
    let cv:String
    let key:String
    
    init(name:String, surname:String, dni:String, age:String, job:String, cv:String, key:String = "") {
        self.ref = nil
        self.key = key
        self.name = name
        self.surname = surname
        self.dni = dni
        self.age = age
        self.job = job
        self.cv = cv
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let surname = value["surname"] as? String,
            let dni = value["dni"] as? String,
            let age = value["age"] as? String,
            let job = value["job"] as? String,
            let cv = value["cv"] as? String
            else {return nil}
        self.key = snapshot.key
        self.ref = snapshot.ref
        self.name = name
        self.surname = surname
        self.dni = dni
        self.age = age
        self.job = job
        self.cv = cv
    }
    
    func toAnyObject() -> Any {
        return [
            "name" : name,
            "surname" : surname,
            "dni" : dni,
            "age" : age,
            "job" : job,
            "cv" : cv
        ]
    }
}
