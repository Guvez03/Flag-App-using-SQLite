//
//  QuizEkrani.swift
//  Flag App
//
//  Created by ahmet on 2.07.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit

class QuizEkrani: UIViewController {

    @IBOutlet weak var dogruSayisi: UILabel!
    @IBOutlet weak var yanlisSayisi: UILabel!
    @IBOutlet weak var soruSayisi: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var answer1outlet: UIButton!
    @IBOutlet weak var answer2outlet: UIButton!
    @IBOutlet weak var answer3outlet: UIButton!
    @IBOutlet weak var answer4outlet: UIButton!
    
    var correctAnswer = Bayraklar()
    var answers = [Bayraklar]()
    var uncrorrectAnswers = [Bayraklar]()
    var mixanswers = Set <Bayraklar>()
    var getDataArray = [Bayraklar]()

    var count = 0
    var correctCount = 0
    var uncorrectCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getDataArray = BayraklarDao().AllPersonsGet() // bütün verileri aldık 5
        
        soruYukle()
  
    }
    func soruYukle(){
        dogruSayisi.text = "Doğru Sayısı : \(correctCount)"
        yanlisSayisi.text = "Yanlış Sayısı : \(uncorrectCount)"
        soruSayisi.text = "Soru Sayısı : \(count+1)"
        
        correctAnswer = getDataArray[count]
        
        flagImage.image = UIImage(named: correctAnswer.bayrak_resim!)
        
        uncrorrectAnswers = BayraklarDao().Uncorrect3PersonsGet(bayrak_id: correctAnswer.bayrak_id!)
        
        mixanswers.removeAll()
        
        mixanswers.insert(correctAnswer)
        mixanswers.insert(uncrorrectAnswers[0])
        mixanswers.insert(uncrorrectAnswers[1])
        mixanswers.insert(uncrorrectAnswers[2])
        
        answers.removeAll()
        
        for i in mixanswers{
            answers.append(i)
        }
        
        answer1outlet.setTitle(answers[0].bayrak_ad, for: .normal)
        answer2outlet.setTitle(answers[1].bayrak_ad, for: .normal)
        answer3outlet.setTitle(answers[2].bayrak_ad, for: .normal)
        answer4outlet.setTitle(answers[3].bayrak_ad, for: .normal)

    }
    func isCorrect(button:UIButton){
        
        let buttonText = button.titleLabel?.text

        if(correctAnswer.bayrak_ad == buttonText){
            correctCount += 1
        }else{
            uncorrectCount += 1
        }
    }
    func AnswerIsFull(){
        count += 1
        if(count == 5){
        
            performSegue(withIdentifier: "quiztoResult", sender: nil)
            
        }else{
            soruYukle()
        }
    
    }
    
    @IBAction func answer1(_ sender: Any) {
        
        isCorrect(button: answer1outlet)
        AnswerIsFull()
    }
    @IBAction func answer2(_ sender: Any) {
        
        isCorrect(button: answer2outlet)
        AnswerIsFull()
    }
    @IBAction func answer3(_ sender: Any) {
        
        isCorrect(button: answer3outlet)
        AnswerIsFull()
    }
    @IBAction func answer4(_ sender: Any) {
        
        isCorrect(button: answer4outlet)
        AnswerIsFull()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let goVC = segue.destination as? SonucEkrani {
            goVC.correctCountNumber = correctCount
            
        }
    }
}
