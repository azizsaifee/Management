//
//  Data.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//


import Foundation

@objcMembers
public class Document: NSObject, NSCoding {
    
    
    var questionNo: Int16
    var question: String
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    var answer: String
    
    init( questionNo: Int16,question:String,option1:String,option2:String,option3:String,option4:String, answer: String) {
        
        self.questionNo = questionNo
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.answer = answer
    }
    
    public func encode(with coder: NSCoder) {
        
        coder.encode(questionNo, forKey: "questionNo")
        coder.encode(question,forKey: "question")
        // coder.encode(options,forKey: "options")
        coder.encode(option1, forKey: "option1")
        coder.encode(option2, forKey: "option2")
        coder.encode(option3, forKey: "option3")
        coder.encode(option4, forKey: "option4")
        coder.encode(answer, forKey: "answer")
    }
    
    override public var description: String {
        return "Documentation:id =  \(questionNo), question: question, option1: option1, option2: option2, option3: option3, option4: option4, answer: answer)"
    }
    
    public required init?(coder: NSCoder) {
        // topic = coder.decodeObject(forKey: "topic") as? [String : [String : String]] ?? [:]
        questionNo = coder.decodeObject(forKey: "questionNo") as! Int16
        question = coder.decodeObject(forKey: "question") as! String
        // options = coder.decodeObject(forKey: "options") as! [String : String]
        option1 = coder.decodeObject(forKey: "option1") as! String
        option2 = coder.decodeObject(forKey: "option2") as! String
        option3 = coder.decodeObject(forKey: "option3") as! String
        option4 = coder.decodeObject(forKey: "option4") as! String
        answer = coder.decodeObject(forKey: "answer") as! String
    }
}




