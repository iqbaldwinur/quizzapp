//
//  ViewController.swift
//  quizzapp
//
//  Created by Iqbal Dwi Nur Khoirul anam on 03/11/18.
//  Copyright © 2018 Iqbal Dwi Nur Khoirul anam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = ["kapan Indonesia Merdeka?", "dimana alamat sekolah idn?","siapa penemu apple?"]
    let answer = [["17 Mei 2018", "21 agustus 1999", "17 agustus 1945"], ["Tangerang", "bogor", "solo"], ["steve jobs", "joko", "sukinem"]]
    
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0;
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBAction func action(_ sender: AnyObject)
    {
        if ((sender as AnyObject).tag == Int(rightAnswerPlacement))
        {
            print ("Right")
            points += 1
        }else {
        
            print("CBL (Coba Lagi) ya kk")
        }
        if (currentQuestion != questions.count)
        {
            newQuestion()
        }else
        {
            performSegue(withIdentifier: "show score", sender: self)
        }
    
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    func newQuestion()
    {
        lbl.text = questions[currentQuestion]
        
        
        
        rightAnswerPlacement = arc4random_uniform(3)+1
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3
        {
            
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answer[currentQuestion][0], for: .normal)
            }
            else
        {
                        button.setTitle(answer[currentQuestion][x], for: .normal)
            x = 2
                    }

            
            }
                currentQuestion = +1
        }
                
                

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

