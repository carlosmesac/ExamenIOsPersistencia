//
//  DetailViewController.swift
//  Prueba
//
//  Created by alumno on 01/01/2020.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cvDetail: UILabel!
    @IBOutlet weak var ageDetail: UILabel!
    @IBOutlet weak var jobDetail: UILabel!
    @IBOutlet weak var dniDetail: UILabel!
    @IBOutlet weak var surnameDetail: UILabel!
    @IBOutlet weak var nameDetail: UILabel!
    var person : PersonItem? 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
    }
    func configureView() {
           // Update the user interface for the detail item.
           
        nameDetail.text = person?.name ?? ""
        surnameDetail.text = person?.surname ?? ""
        dniDetail.text = person?.dni ?? ""
        ageDetail.text = person?.age ?? ""
        jobDetail.text = person?.job ?? ""
        cvDetail.text = person?.cv ?? ""
    
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
