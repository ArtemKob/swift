//
//  ViewController.swift
//  Stanford
//
//  Created by Artem Arhutik on 21.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    
 
lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1 ) / 2 )
                                                  

    var touches = 0 {
        didSet{
            touchLabel.text = ("Touches: \(touches)")
        }
    }
    
      
                                                  
 var emojiCollection = ["🐮", "🐶", "🦁", "🐰", "🐷", "🐸", "🐵", "🪲", "🐋", "🐊", "🐆", "🦮", "🦢", "🦩", "🐿", "🦔", "🐫", "🌻", "🌕", "🔥", "⭐️", "⛄️", "🍉", "🌶", "🍔", "🎂", "⚽️", "🏵", "🚣🏽", "🥇"]
 
 var emojiDictonary = [Int:String]()
 
 func emojiIdentifier(for card: Card) -> String {
  if emojiDictonary[card.identifier] == nil {
   let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
   emojiDictonary[card.identifier] = emojiCollection.remove(at: randomIndex)
   
  }
  return emojiDictonary[card.identifier] ?? "?"
 }
 
  
 
 
 func updateViewFromModel() {
  for index in buttonCollection.indices {
   let button = buttonCollection[index]
   let card = game.cards[index]
   if card.isFaceUP {
    button.setTitle(emojiIdentifier(for: card), for: .normal)
    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
   } else {
    button.setTitle("", for: .normal)
    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
   }
  }
 }
 
 
 

    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
    if let buttonIndex = buttonCollection.firstIndex(of: sender) {
     game.chooseCard(at: buttonIndex)
     updateViewFromModel()
    }
    }

}
