// Playground - noun: a place where people can play

import UIKit
import Foundation

class Game{
var theDeck = [Int]()
var dealer = [Int]()
var player = [Int]()
var counter = 0
var money = 100
    var bet = 0

func ShuffledDeck() ->[Int]
    {
var unShufDeck = [Int]()

for i in 0..<52
{
    unShufDeck.append(i)
}


var shufDeck = [Int]()

for i in 0..<52
{
    var x:Int = Int(arc4random_uniform(UInt32(unShufDeck.count)))
    shufDeck.append(unShufDeck.removeAtIndex(x))
}

return shufDeck

}


func CardInf(cardnum:Int) -> String
{
    var num = cardnum/4
    var card = ""
    switch num
        {
    case 0:
        card = "K"
    case 1:
        card = "A"
    case 2:
        card = "2"
    case 3:
        card = "3"
    case 4:
        card = "4"
    case 5:
        card = "5"
    case 6:
        card = "6"
    case 7:
        card = "7"
    case 8:
        card = "8"
    case 9:
        card = "9"
    case 10:
        card = "10"
    case 11:
        card = "J"
    case 12:
        card = "Q"
    default:
        print("error")
    }
    var type = cardnum/13
    switch type
        {
    case 0:
        card += "D"
    case 1:
        card += "C"
    case 2:
        card += "H"
    case 3:
        card += "S"
    default:
        card += "E"
    }
    return card
}

func CardVal (cardnum: Int) -> Int
{
    var val = 0
    var num = cardnum/4
    switch num
        {
    case 0:
        val = 10
    case 1:
        val = 1
    case 2:
        val = 2
    case 3:
        val = 3
    case 4:
        val = 4
    case 5:
        val = 5
    case 6:
        val = 6
    case 7:
        val = 7
    case 8:
        val = 8
    case 9:
        val = 9
    case 10:
        val = 10
    case 11:
        val = 10
    case 12:
        val = 10
    default:
        print("error")
    }
    return val
}
func Show()
{
    var val = 0
    print("Your hand: ")
    for i in player
    {
        print(CardInf(i) + "  ")
        val += CardVal(i)
    }
    println()
    if(val > 21)
    {
        print("BUST!")
        counter++
        Deal()
    }
}
func Hit()
{
    player.append(theDeck.removeLast())
    Show()
}
func Stay()
{
    var pcscore = 0
    var playerscore = 0
    for i in dealer
    {
        pcscore += CardVal(i)
    }
    for i in player
    {
        playerscore += CardVal(i)
    }
    println("Dealer has  \(pcscore)")
    println("Player has  \(playerscore)")
    if pcscore > playerscore{
        println("You lose")
        money -= bet
        println("Money :\(money)")
    }
    else if pcscore == playerscore{
        println("You tied")
    println("Money :\(money)")}
    else{
        println("You Win!")
        money += bet
        println("Money :\(money)")
    }
    counter++
    Deal()
}
init()
{
    println("Cards are listed by rank and initial of suit")
    println("AS means the Ace of Spades")
    Deal()
}
    func Bet(bet: Int)
    {
        self.bet = bet
    }
func Deal()
{
    Bet(1)
    
    if counter%5 == 0
    {
    theDeck = ShuffledDeck()
    }
     dealer = [Int]()
     player = [Int]()
    
    dealer.append(theDeck.removeLast())
    player.append(theDeck.removeLast())
    dealer.append(theDeck.removeLast())
    player.append(theDeck.removeLast())
    println("Dealer has " + CardInf(dealer[1]))
    Show()
}
}

var game1 = Game()
game1.Hit()
game1.Stay()
