//
//  ViewController.swift
//  Who am I
//
//  Created by 9i on 2/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var points: UILabel!
    
    @IBOutlet var guess: UITextField!
    
    @IBOutlet var info: UILabel!
    
    
    var person = people[0]
    
    var point = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updatePoint()
        nextPerson()
    }
    
    
    func rando() -> Int{
        return Int.random(in:0...people.count - 1)
    }
    
    func nextPerson(){
        let x = rando()
        person = people.remove(at: x)
        image.image = person.image
        info.text = person.description
        
        
    }
    func updatePoint(){
        points.text = String(point)
    }
    
    @IBAction func answer(_ sender: Any) {
        guard !people.isEmpty else{return}
        if let name = guess.text{
            if name.lowercased() == person.name.lowercased(){
                point += 1
            }
        }
        updatePoint()
        nextPerson()
    }
    
}
struct Person{
    var image:UIImage
    var name: String
    var description:String
    
}
var people = [Person(image:UIImage(named: "image1")!, name: "Lauryn Hill", description: ""), Person(image:UIImage(named: "")!, name: "", description: ""), Person(image:UIImage(named: "")!, name: "", description: ""), Person(image:UIImage(named: "")!, name: "", description: ""), Person(image:UIImage(named: "")!, name: "", description: "")]
