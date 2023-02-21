//
//  StructureOfData.swift
//  Project Management
//
//  Created by Apple on 13/02/23.
//

import Foundation

@objcMembers
public class Documentation: NSObject, NSCoding {
    var topic: [String : [String : String]] = [:]
    
    init(topic: [String : [String : String]]) {
        self.topic = topic
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(topic, forKey: "topic")
    }
    
    public required init?(coder: NSCoder) {
        topic = coder.decodeObject(forKey: "topic") as? [String : [String : String]] ?? [:]
    }
}

@objcMembers
public class Features: NSObject, NSCoding {
    var topic: [String : [String : String]] = [:]
    
    init(topic: [String : [String : String]]) {
        self.topic = topic
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(topic, forKey: "topic")
    }
    
    public required init?(coder: NSCoder) {
        topic = coder.decodeObject(forKey: "topic") as? [String : [String : String]] ?? [:]
    }
}

@objcMembers
public class Credentials: NSObject, NSCoding {
    var topic: [String: [String : String]] = [:]
    
    init(topic: [String: [String : String]]) {
        self.topic = topic
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(topic, forKey: "topic")
    }
    
    public required init?(coder: NSCoder) {
        topic = coder.decodeObject(forKey: "topic") as? [String: [String : String]] ?? [:]
    }
}

@objcMembers
public class Issues: NSObject, NSCoding {
    var topic: [String : [String : String]] = [:]
    
    init(topic: [String : [String : String]]) {
        self.topic = topic
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(topic, forKey: "topic")
    }
    
    public required init?(coder: NSCoder) {
        topic = coder.decodeObject(forKey: "topic") as? [String : [String : String]] ?? [:]
    }
}

@objcMembers
public class DataDictionary: NSObject, NSCoding {
    var id: String
    var features: Features
    var documentation: Documentation
    var issues: Issues
    var credentials: Credentials
    
    init(id: String, features: Features, documentation: Documentation, issues: Issues, credentials: Credentials) {
        self.id = id
        self.features = features
        self.documentation = documentation
        self.issues = issues
        self.credentials = credentials
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(features, forKey: "features")
        coder.encode(documentation, forKey: "documentation")
        coder.encode(issues, forKey: "issues")
        coder.encode(credentials, forKey: "credentials")
    }
    
    override public var description: String {
            return "DataDictionary: id = \(id) , features = \(features), documentation = \(documentation), issues = \(issues), credentials = \(credentials)"
        }
    
    required public init?(coder: NSCoder) {
        self.id = coder.decodeObject(forKey: "id") as! String
        self.features = coder.decodeObject(forKey: "features") as! Features
        self.documentation = coder.decodeObject(forKey: "documentation") as! Documentation
        self.issues = coder.decodeObject(forKey: "issues") as! Issues
        self.credentials = coder.decodeObject(forKey: "credentials") as! Credentials
    }
}
