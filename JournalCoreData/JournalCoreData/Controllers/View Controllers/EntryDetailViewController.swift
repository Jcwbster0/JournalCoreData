//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Justin Webster on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var titleTextLabel: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //MARK: - Properties
    
    var entry: Entry?

    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextLabel.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else {return}
        if let entry = entry {
            entry.title = title
            entry.bodyText = body
            EntryController.sharedInstance.updateEntry(entry)
        } else {
            EntryController.sharedInstance.createEntry(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        titleTextLabel.text = ""
        bodyTextView.text = ""
    }
    
    //MARK: - Functions
    
    func updateView() {
        guard let entry = entry else {return}
        titleTextLabel.text = entry.title
        bodyTextView.text = entry.bodyText
        
    }
    
}//End of Class
