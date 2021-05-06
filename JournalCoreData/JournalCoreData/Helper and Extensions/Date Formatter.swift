//
//  File.swift
//  JournalCoreData
//
//  Created by Justin Webster on 4/26/21.
//

import Foundation

extension DateFormatter {
    
    static let EntryTime: DateFormatter = {
       
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        return formatter
    }()
}
