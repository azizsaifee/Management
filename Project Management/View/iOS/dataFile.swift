//
//  dataFile.swift
//  Project Management
//
//  Created by Ayush Bharadwaj on 09/02/23.
//


import Foundation

struct Symbol: Hashable {
    var title: String?
    var Appicon: String?
    var symbol: [SymbolItem]
    
}

struct SymbolItem: Hashable {
    var title: String
    var Appicon: String?
}

class ItemSection {
    var outlineItem = [
        Symbol(
        title: "Eco Bank",
        Appicon: "Eco Bank",
        symbol: [SymbolItem(
            title: "Eco Bank",
            Appicon: "Eco Bank")]),
        Symbol(
            title: "DTB",
            Appicon: "DTB-Logo",
            symbol: [SymbolItem(
                title: "DTB-KE",
                Appicon: "DTB-Logo"),
                     SymbolItem(
                        title: "DTB-TZ",
                        Appicon: "DTB-Logo"),
                     SymbolItem(
                        title: "DTB-UG",
                        Appicon: "DTB-Logo")]),
        Symbol(
            title: "Stanbic",
            Appicon: "Stanbic",
            symbol: [SymbolItem(
                title: "Stanbic",
                Appicon: "Stanbic")]),
        Symbol(
            title: "ART",
            Appicon: "apple",
            symbol: [SymbolItem(
                title: "Art",
                Appicon: "apple")])
    ]
}

