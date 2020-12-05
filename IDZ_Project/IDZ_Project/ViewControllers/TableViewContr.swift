//
//  TableViewContr.swift
//  IDZ_Project
//
//  Created by Ais Moll on 04.12.2020.
//  Copyright © 2020 Ais Moll. All rights reserved.
//

import UIKit

class TableViewContr: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var books: [BookClass] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isEditing = true
        tableView.rowHeight = 100;
        
        books.append(BookClass(Quantity: 12, Title: "Harry Potter", Author: "Joane Rouling"))
        books.append(BookClass(Quantity: 4, Title: "Three Men's Hearts", Author: "Jack London"))
        books.append(BookClass(Quantity: 1, Title: "Time to live and time to die", Author: "E.M. Remark"))
        books.append(BookClass(Quantity: 21, Title: "Voyna i Mir", Author: "L.N. Tolstoy"))
        books.append(BookClass(Quantity: 0, Title: "The complete course of history lessons", Author: "S.F. Platonov"))
        books.append(BookClass(Quantity: 17, Title: "The Pirate", Author: "Valter Scott"))
        books.append(BookClass(Quantity: 0, Title: "Idiot", Author: "F.M. Dostoevsky"))
    }
    @IBAction func RemoveCellTouch(_ sender: UIButton) {
        books.remove(at: sender.tag)
        let indexPath = IndexPath(item: sender.tag, section: 0)
        tableView.deleteRows(at: [indexPath], with: .fade)
        let rows = tableView.numberOfRows(inSection: 0)
        
        if (rows > 0 && sender.tag < rows) {
            
            for i in sender.tag...(rows - 1) {
                let path = IndexPath(item: i, section: 0)
                let cell = tableView.cellForRow(at: path) as? BookViewCell
                cell?.CellActionButton.tag = i
            }
        }
    }
    @IBAction func AddCellTouch(_ sender: UIButton) {
        books.append(BookClass(Quantity: 0, Title: "My new book", Author: "Unknown"))
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: books.count - 1, section: 0)], with: .fade)
        tableView.endUpdates()
        
    }
}
extension TableViewContr: UITableViewDelegate{
    
}
extension TableViewContr: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as?
        BookViewCell {
            
            let book = books[indexPath.row]
            cell.TitleLabel.text = book.Title
            let index = indexPath.row
            cell.AuthorLabel.text = book.Author
            //cell.showsReorderControl = true;
            cell.StatusLabel.text = book.Status
            cell.StatusLabel.textColor = book.Color
            cell.CellActionButton.tag = index;
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
                
        let book = books[sourceIndexPath.row]
        books.remove(at: sourceIndexPath.row)
        books.insert(book, at: destinationIndexPath.row)
        
        let fromItem = tableView.cellForRow(at: sourceIndexPath) as? BookViewCell
        fromItem?.CellActionButton.tag = destinationIndexPath.row
        
        let toItem = tableView.cellForRow(at: destinationIndexPath) as? BookViewCell
        toItem?.CellActionButton.tag = sourceIndexPath.row
    }
   /* func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        
        let moved = tableView.headlines[sourceIndexPath.row]
        headlines.remove(at: sourceIndexPath.row)
        headlines.insert(moved, at: destinationIndexPath.row)
    } */
}

