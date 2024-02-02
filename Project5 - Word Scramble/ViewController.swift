//
//  ViewController.swift
//  Project5 - Word Scramble
//
//  Created by Zeeshan Waheed on 03/02/2024.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
//      to find the start.txt file
        if let startWordsURL = Bundle.main.url(forResource: "start",
                                               withExtension: "txt") {
//          to find if the words exist
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
//                print(allWords)
            }
        }
//      if the words do not exist and list is empty then this code runs
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    
    
    func startGame() {
//      sets title to random word from array, which player uses to find subwords of array
        title = allWords.randomElement()
//      removes all values from usedWords array
        usedWords.removeAll(keepingCapacity: true)
//      It reloads all data and rows from scratch, great to use when our game changes level
        tableView.reloadData()
    }
    
//  number of rows in table view using array elements count
    override func numberOfSections(in tableView: UITableView) -> Int {
        return usedWords.count
    }
    
//  what data to display
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//      selects the prototype cell identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "work", for: indexPath)
//      passes data to display at respective row
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
//  usnig objc such that we can use the method for rightbarbutton
    @objc func promptForAnswer() {
//      adding an alert
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
//      adding a text field
        ac.addTextField()
        
//      using trailing closure syntax
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
//          specifies the input to the closure
//          before in we have our parameters and after it we have our closure body
            [weak self, weak ac] _ in
//          using ? for a weak reference beacause it can be nil in the future
//          if nothing is entered in the text are it returns nothing
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
//      creating a button
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        
    }
}

