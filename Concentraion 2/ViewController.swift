//
//  ViewController.swift
//  Concentraion 2
//
//  Created by ARNAV SINGHANIA on 4/12/18.
//  Copyright © 2018 Singhania Tech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var newGameLabel: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet var cardButtonsArray: [UIButton]!
    private var brain = ConcentrationBrain(numOfCardPairs: 9)
    private let animalsEmojis = ["🐶","🦁","🐼","🦄","🐛","🦋","🐳","🐿","🐇"]
    private let foodEmojis = ["🍉","🥝","🍔","🍟","🍕","🥗","🍝","🍙","🥧"]
    private let sportsEmojis = ["🥈","🏄🏻‍♀️","⚽️","⚾️","🏌️‍♀️","🤸‍♂️","🤾🏾‍♂️","🏊🏻‍♀️","🤼‍♀️"]
    private let faceEmojis = ["😌","🤯","👻","🙄","🤡","😴","🤗","🤑","😈"]
    private var themeNum = 0
    private var audioPlayer: AVAudioPlayer!
    private var audioPlayer2: AVAudioPlayer!
    private var soundStatus = true
    private let userDefault = UserDefaults.standard
    
    @IBOutlet weak var concentrationLabel: UILabel!
    @IBOutlet weak var volumeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3")
        let url2 = Bundle.main.url(forResource: "buttonClickSound", withExtension: "mp3")
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url!)
            self.audioPlayer2 = try AVAudioPlayer(contentsOf: url2!)
            self.audioPlayer.play()
            self.audioPlayer.numberOfLoops = -1
            self.audioPlayer2.prepareToPlay()
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        self.volumeButton.setTitle("🔊", for: UIControlState.normal)

        if let savedHighScore = userDefault.value(forKey: "highScore") {
            brain.highScore = savedHighScore as! Int
        }
        
        print(brain.highScore)
        
    }
    
    @IBAction func volumeButtonClicked(_ sender: UIButton) {
        
        if (self.soundStatus) {
            self.soundStatus = false
            self.volumeButton.setTitle("🔇", for: UIControlState.normal)
            self.audioPlayer.stop()
        } else {
            self.soundStatus = true
            self.volumeButton.setTitle("🔊", for: UIControlState.normal)
            self.audioPlayer.play()
        }
        
    }
    
    @IBAction func helpButtonClicked() {
        
        let alert = UIAlertController(title: "How To Play?", message: "Put your concentration power to the test. Match same cards to score 2 points. However, if a card is opened more than once, without being matched, you lose a point. So, concentrate and enjoy the game.", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Play", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func cardButtonClicked(_ sender: UIButton) {
        brain.cardPressed(index: cardButtonsArray.index(of: sender)!)
        self.update();
        if (self.soundStatus) {
            self.audioPlayer2.play()
        }
    }
    
    @IBAction func newGameButtonClicked() {
        
        self.audioPlayer2.play()
        self.themeNum = Int(arc4random_uniform(4))
        
        if (self.themeNum == 0) {
            view.backgroundColor = #colorLiteral(red: 0.03137254902, green: 0.03137254902, blue: 0.368627451, alpha: 1)
            self.concentrationLabel.textColor = #colorLiteral(red: 0.6352941176, green: 0.937254902, blue: 0.2666666667, alpha: 1)
            self.pointsLabel.textColor = #colorLiteral(red: 0.6352941176, green: 0.937254902, blue: 0.2666666667, alpha: 1)
            self.newGameLabel.setTitleColor(#colorLiteral(red: 0.6352941176, green: 0.937254902, blue: 0.2666666667, alpha: 1), for: UIControlState.normal)
        } else if (self.themeNum == 1) {
            view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2156862745, blue: 0.2705882353, alpha: 1)
            self.concentrationLabel.textColor = #colorLiteral(red: 0.9176470588, green: 0.1803921569, blue: 0.2862745098, alpha: 1)
            self.pointsLabel.textColor = #colorLiteral(red: 0.9176470588, green: 0.1803921569, blue: 0.2862745098, alpha: 1)
            self.newGameLabel.setTitleColor(#colorLiteral(red: 0.9176470588, green: 0.1803921569, blue: 0.2862745098, alpha: 1), for: UIControlState.normal)
        } else if (self.themeNum == 2) {
            view.backgroundColor = #colorLiteral(red: 1, green: 0.1019607843, blue: 0.4156862745, alpha: 1)
            self.concentrationLabel.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            self.pointsLabel.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            self.newGameLabel.setTitleColor(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), for: UIControlState.normal)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.8823529412, blue: 0.8392156863, alpha: 1)
            self.concentrationLabel.textColor = #colorLiteral(red: 1, green: 0.9843137255, blue: 0.5921568627, alpha: 1)
            self.pointsLabel.textColor = #colorLiteral(red: 1, green: 0.9843137255, blue: 0.5921568627, alpha: 1)
            self.newGameLabel.setTitleColor(#colorLiteral(red: 1, green: 0.9843137255, blue: 0.5921568627, alpha: 1), for: UIControlState.normal)
        }
        
        brain = ConcentrationBrain(numOfCardPairs: 9)
        self.pointsLabel.text = "Points: \(brain.points)"
        
        for index in cardButtonsArray.indices {
            self.cardButtonsArray[index].isEnabled = true
        }
        
        self.update()
        
        if let savedHighScore = userDefault.value(forKey: "highScore") {
            brain.highScore = savedHighScore as! Int
        }
        
        print(brain.highScore)
        
    }
    
    private func update() {
        
        for index in 0..<cardButtonsArray.count {
            
            if (brain.cardsArray[index].isFaceUp) {
                
                if (self.themeNum == 0) {
                    self.cardButtonsArray[index].setTitle(animalsEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                    self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 1, green: 0.9411764706, blue: 0.4784313725, alpha: 1)
                } else if (self.themeNum == 1) {
                     self.cardButtonsArray[index].setTitle(foodEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                     self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.4666666667, green: 0.768627451, blue: 0.8274509804, alpha: 1)
                } else if (self.themeNum == 2) {
                    self.cardButtonsArray[index].setTitle(faceEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                    self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.9294117647, blue: 0.9529411765, alpha: 1)
                } else if (self.themeNum == 3) {
                    self.cardButtonsArray[index].setTitle(sportsEmojis[brain.cardsArray[index].identifier], for: UIControlState.normal)
                    self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.5921568627, green: 1, blue: 0.8117647059, alpha: 1)
                }
                
            } else {
                
                if (!brain.cardsArray[index].matched) {
                    if (self.themeNum == 0) {
                        self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.6352941176, green: 0.937254902, blue: 0.2666666667, alpha: 1)
                    } else if (self.themeNum == 1) {
                        self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.1803921569, blue: 0.2862745098, alpha: 1)
                    } else if (self.themeNum == 2) {
                        self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.4666666667, blue: 0.7843137255, alpha: 1)
                    } else {
                        self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 1, green: 0.9843137255, blue: 0.5921568627, alpha: 1)
                    }
                    self.cardButtonsArray[index].setTitle("", for: UIControlState.normal)
                } else {
                    self.cardButtonsArray[index].backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                    self.cardButtonsArray[index].setTitle("", for: UIControlState.normal)
                    self.cardButtonsArray[index].isEnabled = false
                }
            }
            
        }
        
        if (brain.numOfCardsFacedUp == 2) {
            close()
            if(brain.checkForMatch()) {
                self.cardButtonsArray[brain.indexesOfCardsFacedUp[0]].isEnabled = false
                self.cardButtonsArray[brain.indexesOfCardsFacedUp[1]].isEnabled = false
                
                    brain.cardsFacedUp.removeAll()
                    brain.indexesOfCardsFacedUp.removeAll()
            }
            self.pointsLabel.text = "Points: \(brain.points)"
            
            if (brain.highScore < brain.points) {
                brain.highScore = brain.points
                userDefault.set(brain.highScore, forKey: "highScore")
            }
            
            print(brain.highScore)
        }
        
    }
    
    private func close() {
        
        for index in 0..<brain.cardsArray.count {
            
            if (brain.cardsArray[index].isFaceUp) {
                brain.cardPressed(index: index)
                brain.cardsFacedUp.append(brain.cardsArray[index])
                brain.indexesOfCardsFacedUp.append(index)
            }
            
        }
        
        brain.numOfCardsFacedUp = 0
        
    }
    
}

