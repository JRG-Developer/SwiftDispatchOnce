//
//  DispatchQueue+Once.swift
//  SwiftDispatchOnce
//
//  Created by Joshua Greene on 8/9/17.
//  Copyright © 2017 Joshua Greene. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

// Attribution: https://stackoverflow.com/questions/37886994/dispatch-once-in-swift-3

import Foundation

public extension DispatchQueue {
  
  private static var _onceTracker = [String]()
  
  /// Executes a block of code, associated with a given file, function and line number, only once. The code is thread 
  /// safe and will only execute the code once even in the presence of multithreaded calls.
  ///
  /// - Parameters:
  ///   - file: The file name, defaults to current file name
  ///   - function: The function name, defaults to current function name
  ///   - line: The line number, defaults to current line number
  ///   - closure: The closure to execute once
  public class func once(file: String = #file, function: String = #function, line: Int = #line, closure:()->Void) {
    let token = file + ":" + function + ":" + String(line)
    once(token: token, closure: closure)
  }
  
  /// Executes a block of code, associated with a given file, function and line number, only once. The code is thread
  /// safe and will only execute the code once even in the presence of multithreaded calls.
  ///
  /// - Parameters:
  ///   - token: A unique reverse DNS style name such as software.harmony.<name> or a GUID
  ///   - closure: The closure to execute once
  public class func once(token: String, closure:()->Void) {
    objc_sync_enter(self)
    defer { objc_sync_exit(self) }
    if _onceTracker.contains(token) { return }
    _onceTracker.append(token)
    closure()
  }
}
