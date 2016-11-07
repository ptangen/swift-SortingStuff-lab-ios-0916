//
//  ViewController.swift
//  ClosuresAreGreat
//
//  Created by Jim Campagno on 10/24/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let ship1 = Ship(name:"BlueShip", age:4)
    let ship2 = Ship(name:"GrayShip", age:14)
    let ship3 = Ship(name:"RedShip", age:34)
    let ship4 = Ship(name:"YellowShip", age:72)
    let myShips = [ship2, ship1, ship4, ship3]
    
    let book1 = Book(name: "BlueBook", year: 1723, author: "Jerry")
    let book2 = Book(name: "GrayBook", year: 1897, author: "Bill")
    let book3 = Book(name: "RedBook", year: 1937, author: "Joe")
    let book4 = Book(name: "YellowBook", year: 2016, author: "Marie")
    let myBooks = [book4,book2,book1,book3]
    
    var pin1 = BowlingPin(name: "BluePin", film: "Film1", color: .blue)
    var pin2 = BowlingPin(name: "OrangePin", film: "Film2", color: .organe)
    var pin3 = BowlingPin(name: "RedPin", film: "Film3", color: .red)
    var pin4 = BowlingPin(name: "YellowPin", film: "Film4", color: .yellow)
    var myPins = [pin4,pin2,pin1,pin3]
    
    let cd1 = MusicCD(name: "BlueCD", year: 2009, songs: ["first song", "second song", "third song"])
    let cd2 = MusicCD(name: "OrangeCD", year: 2013, songs: ["first song", "second song", "third song"])
    let cd3 = MusicCD(name: "RedCD", year: 2016, songs: ["first song", "second song", "third song"])
    let cd4 = MusicCD(name: "YellowCD", year: 2012, songs: ["first song", "second song", "third song"])
    let myCDs = [cd4, cd2, cd1, cd3]
    
    var toybin1 = ToyBin(ships: myShips, books: myBooks, bowlingPins: myPins, musicCDs: myCDs)
    
    // sorting ships by age
    print("before: \(toybin1.ships)\n")
    var sortedShips = toybin1.ships.sorted{ (ship1, ship2) -> Bool in
      ship1.age < ship2.age
    }
    let redShipFound = sortedShips.contains(where: { $0.name == "RedShip" }) // returns true if the object's name property = Redship found
    print("redShipFound = \(redShipFound)")
    // move one item to the 0 slot in the array
    for (index, ship) in sortedShips.enumerated() {
      if ship.name == "RedShip" {
        let redShip = sortedShips[index]
        sortedShips.remove(at: index)
        sortedShips.insert(redShip, at: 0)
      }
    }
    toybin1.ships = sortedShips
    print("after: \(toybin1.ships)\n")
    
    // sorting book by name
    print("before: \(toybin1.books)\n")
    var sortedBooks = toybin1.books.sorted{ (book1, book2) -> Bool in  // long hand version
      book1.name < book2.name
    }
    sortedBooks = toybin1.books.sorted(by: { $0.name < $1.name }) // short hand version
    toybin1.books = sortedBooks
    print("after: \(toybin1.books)\n")
    
    // sorting bowling pins
    print("before: \(toybin1.bowlingPins)\n")
    var sortedBowlingPins = toybin1.bowlingPins.sorted(by: { $0.color.rawValue < $1.color.rawValue }) // short hand version
    toybin1.bowlingPins = sortedBowlingPins
    print("after: \(toybin1.bowlingPins)\n")
    
    // sorting CDs by ?
    print("before: \(toybin1.musicCDs)\n")
    var sortedCDs = toybin1.musicCDs.sorted(by: { $0.name < $1.name }) // short hand version
    
    for (index, cd) in sortedCDs.enumerated() {
      if cd.name == "RedCD" {
        let redCD = sortedCDs[index]
        sortedCDs.remove(at: index)
        sortedCDs.insert(redCD, at: 0)
      }
    }
    toybin1.musicCDs = sortedCDs
    print("after: \(toybin1.musicCDs)\n")
    
    // Implement this function by calling the map function on our bowlingPins stored property. This function call will return back a new array (of the same type of the function thats calling it) which means it will return back a [BowlingPin] array.
    // stringsArray = moneyArray.map({"\($0)€"})
    
    // change the color of the bowling pins
    func changeColorOfAllPins(to newColor: Color) {
      print("before: \(toybin1.bowlingPins)\n")
      
      let newBowlingPins =  toybin1.bowlingPins.map { pin -> (BowlingPin) in
        // when you iterate through an array of structs the parameter (pin, in this case) is a constant. To change it, create a copy, edit that and then replace the array in the parent object.
        var newPin = pin
        newPin.changeColor(to: newColor)
        return newPin
      }
      toybin1.bowlingPins = newBowlingPins

      print("after: \(toybin1.bowlingPins)\n")
    }
    changeColorOfAllPins(to: Color.green)
    
  }
}



