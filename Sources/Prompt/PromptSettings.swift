//
//  PromptSettings.swift
//  PromptSettings
//
//  Created by Omar Abdelhafith on 02/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


public class PromptSettings {

    public static var reader: PromptReader = ConsolePromptReader()
    public static var printer: PromptPrinter = ConsolePromptPrinter()

    public class func read() -> String? {
        return reader.read()
    }

    public class func print(_ string: String, terminator: String = "\n") {
        return printer.printString(string, terminator: terminator)
    }
}
