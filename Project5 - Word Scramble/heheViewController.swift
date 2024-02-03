////
////  ViewController.swift
////  Project5 - Word Scramble
////
////  Created by Zeeshan Waheed on 03/02/2024.
////
//
//import UIKit
//
//class ViewController: UITableViewController {
//    var allWords = [String]()
//    var usedWords = [String]()
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
//        
////      to find the start.txt file
//        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
////          to find if the words exist
//            if let startWords = try? String(contentsOfFile: startWordsPath) {
//                allWords = startWords.components(separatedBy: "\n")
////                print(allWords)
//            }
//        }
////      if the words do not exist and list is empty then this code runs
//        if allWords.isEmpty {
//            allWords = ["silkworm"]
//        }
//        
//        startGame()
//    }
//    
//    
//    
//    func startGame() {
////      sets title to random word from array, which player uses to find subwords of array
//        title = allWords.randomElement()
////      removes all values from usedWords array
//        usedWords.removeAll(keepingCapacity: true)
////      It reloads all data and rows from scratch, great to use when our game changes level
//        tableView.reloadData()
//    }
//    
////  number of rows in table view using array elements count
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return usedWords.count
//    }
//    
////  what data to display
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////      selects the prototype cell identifier
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
////      passes data to display at respective row
//        cell.textLabel?.text = usedWords[indexPath.row]
//        return cell
//    }
//    
////  usnig objc such that we can use the method for rightbarbutton
//    @objc func promptForAnswer() {
////      adding an alert
//        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
////      adding a text field
//        ac.addTextField()
//        
////      using trailing closure syntax
////      specifies the input to the closure
////      before in we have our parameters and after it we have our closure body
////      using ? for a weak reference beacause it can be nil in the future
////      if nothing is entered in the text are it returns nothing
//        let submitAction = UIAlertAction(title: "Submit", style:
//            .default) { [unowned self, ac] action in
//            let answer = ac.textFields![0]
//            self.submit(answer.text!)
//        }
//        
////      creating a button
//        ac.addAction(submitAction)
//        present(ac, animated: true)
//    }
//    
//    func submit(_ answer: String) {
////      making all strings lowercased
//        let lowerAnswer = answer.lowercased()
//        
//        let errorTitle: String
//        let errorMessage: String
//        
//        
//        if isPossible(word: lowerAnswer) {
//            if isOrignal(word: lowerAnswer) {
//                if isReal(word: lowerAnswer) {
////                  inserting word to usedwords array
//                    usedWords.insert(lowerAnswer, at: 0)
//                    
//                    let indexPath = IndexPath(row: 0, section: 0)
//                    tableView.insertRows(at: [indexPath], with: .automatic)
//                    return
//                } else {
//                    errorTitle = "Word not recognized"
//                    errorMessage = "You can't just make them up, you know!"
//                }
//            }  else {
//                errorTitle = "Word alreaedy used"
//                errorMessage = "Be more orignal!"
//            }
//        } else {
//            errorTitle = "Word not possible"
//            errorMessage = "You can't spell that word from \(title!.lowercased())"
//        }
//        
//        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
//    }
//    
//    func isPossible(word: String) -> Bool {
//        var tempWord = title!.lowercased()
//        
//        for letter in word {
//            if let position = tempWord.range(of: String(letter)) {
//                tempWord.remove(at: position.lowerBound)
//            } else {
//                return false
//            }
//        }
//        
//        return true
//    }
//    
//    func isOrignal(word: String) -> Bool {
//        return !usedWords.contains(word)
//    }
//    
//    func isReal(word: String) -> Bool {
//        let checker = UITextChecker()
////      telling the range of the word, when we work with UIkit sprite kit or an apple frame work use .utf16.count
////      else use .count
//        let range = NSMakeRange(0, word.utf16.count)
//        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//        
//        return misspelledRange.location == NSNotFound
//    }
//}
//
