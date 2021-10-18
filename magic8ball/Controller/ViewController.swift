//
//  ViewController.swift
//  magic8ball
//
//  Created by Maksym Mezhuiev on 08.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getAnswer: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(from: urlString)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    
    private func getData(from urlString: String) {
        guard let url = URL(string: urlString) else{return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(Resultat.self, from: data)
                print(result)
                jsonAnswer = result.magic.answer
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    func showAlert() {
        let alert = UIAlertController(title: "No predictions", message: "Go to settings and enter your variants of answer", preferredStyle: .alert)
        
        let action =  UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            getData(from: urlString)
            if jsonAnswer != "" {
                getAnswer.text = jsonAnswer
                jsonAnswer = ""
            } else if dAnswers.isEmpty == false {
               
            
            getAnswer.text = dAnswers.shuffled().first
            }
            else {
                showAlert()
            }
        }
    }
    
}
