//
//  EditViewController.swift
//  Prueba
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var valoracionInput: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var surnameInput: UITextField!
    @IBOutlet weak var dniInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var jobInput: UITextField!
    @IBOutlet weak var cvInput: UITextField!
    var person:PersonItem?
    var editModel = EditModel()
    var name:String = ""
    var surname:String = ""
    var dni:String = ""
    var age:String = ""
    var job:String = ""
    var cv:String = ""
    var valoracion:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel.alpha = 0
        configureView()
    }
    func configureView() {
           // Update the user interface for the detail item.
           
        nameInput.text = person?.name ?? ""
        surnameInput.text = person?.surname ?? ""
        dniInput.text = person?.dni ?? ""
        ageInput.text = person?.age ?? ""
        jobInput.text = person?.job ?? ""
        cvInput.text = person?.cv ?? ""
        valoracionInput.text = person?.valoracion ?? ""
    
    }

    @IBAction func addTapped(_ sender: Any) {
        name = nameInput.text!
        surname = surnameInput.text!
        dni = dniInput.text!
        age = ageInput.text!
        job = jobInput.text!
        cv = cvInput.text!
        valoracion = valoracionInput.text!
        editModel.validateFields(name: name, surname: surname, dni: dni, age: age, job: job, cv: cv, valoracion: valoracion) { (error, String) in
            if(!error){
                self.editModel.editPerson(name: self.name, surname: self.surname, dni: self.dni, age: self.age, job: self.job, cv: self.cv, valoracion: self.valoracion) { (error) in
                    if(!error){
                        let navBar = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.navController) as? UINavigationController
                                         
                           self.view.window?.rootViewController = navBar
                           self.view.window?.makeKeyAndVisible()
                    }else{
                        self.errorLabel.text = "An error has ocurred"
                        self.errorLabel.alpha = 1
                    }
                }
            }else{
                self.errorLabel.text = String
                self.errorLabel.alpha = 1
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
