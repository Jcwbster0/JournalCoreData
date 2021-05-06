//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Justin Webster on 4/26/21.
//

import CoreData

class EntryController {
    
    //MARK: - Propertries
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - Functions
    
    func createEntry(title: String, body: String) {
        let entry = Entry(title: title, bodyText: body)
        entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.entries = entries
    }
    
    func updateEntry (_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(_ entryToDelete: Entry) {
        guard let index = entries.firstIndex(of: entryToDelete) else {return}
        entries.remove(at: index)
        CoreDataStack.container.viewContext.delete(entryToDelete)
        CoreDataStack.saveContext()
    }
    
}//End of Class
