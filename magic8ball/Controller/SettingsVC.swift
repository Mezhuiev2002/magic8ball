//
//  SettingsVC.swift
//  magic8ball
//
//  Created by Maksym Mezhuiev on 08.10.2021.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var addAnswer: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

    @IBAction func appendArray(_ sender: Any) {
        dAnswers.append(addAnswer.text!)
        addAnswer.text = ""
    }
    

}
