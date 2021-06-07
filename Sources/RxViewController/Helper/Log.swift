//
//  Log.swift
//  
//
//  Created by Kimun Kwon on 2021/02/20.
//

import Foundation

struct Log {

    public static func print(d: Any..., file: String = #file, line: Int = #line) {
        #if DEBUG
        var filename: NSString = file as NSString
        filename = filename.lastPathComponent as NSString
        Swift.debugPrint(NSString(format: "[💡]%@[L:%d]", filename, line), d, separator: " ")
        #endif
    }

    public static func warning(d: Any..., file: String = #file, line: Int = #line) {
        #if DEBUG
        var filename: NSString = file as NSString
        filename = filename.lastPathComponent as NSString
        Swift.debugPrint(NSString(format: "[⚠️]%@[L:%d]", filename, line), d, separator: " ")
        #endif
    }
}
