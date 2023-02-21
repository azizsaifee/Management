//
//  TableOfContents.swift
//  Project Management
//
//  Created by Apple on 08/02/23.
//

import Foundation

var dataOfEcoBank = DataDictionary (
    id: "EcoBank",
    
    features: Features(topic: [
        "Table View Features" :
            ["Feature 1" : "This feature was prepped by using diffable data source into mind."],
        "Window Open Issue" :
            ["Window Feature 1" : "Issue should be resolved at the earliest."]
    ]),
    
    documentation: Documentation(topic: [
        
        "Onboarding" :
            ["signup" : "onboarding is a highly valuable thing to be done by the company for the betterment of the system of the employees working over there as it makes very easy for the coming employees to be transitiones easily into the new role."],
        
        "Pin Status Management" :
            ["Pin Change" : "Pin status management is managed"],
        
        "Transfer Module" :
            ["Transfer Module" : "This is the transfer Module"],
        
        "Balance Enquiry" :
            ["Balance" : "This is about the user balance enquiry"],
        
        "Push Notifications" :
            ["Notification" : "This is about the push notifications achieved by the user."],
        
        "Active service management" :
            ["Active Service management" : "This is topic on active service management."],
        
        "Authentication" :
            ["2Fa Authentication" : "This is all about the 2Fa authentication done by the user."],
        
        "FLow limits" :
            ["Flow of profile" : "This is all about the flow limit achieved by the user."],
        
        "Dual currency and Exchange Rate" :
            ["Latest Rates" : "This the is about the use of dual currency and exchange rate."],
        
        "Reset Pin" :
            [ "How to reset" : "This is all about resetting the pin."]
    ]),
    
    issues: Issues(topic: [
        
        "Label Flow Issue" :
            [ "label Outline Flow" : "this issue is arising as the label is getting out of its bound in some of the devices."]
    ]),
    
    credentials: Credentials(topic: [
        "Login Details" :
            ["Aziz Login" : "ID : Pass"]
    ])
)

