// The MIT License (MIT)
//
//  Copyright © 2019 Jay Lee <jaeho.lee@snu.ac.kr>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import CoreGraphics
#if os(iOS) || os(tvOS)
  import UIKit.UIGeometry
#endif

public protocol Extensible {}

public extension Extensible where Self: Any {
    func `let`<T>(_ block: (inout Self) throws -> T) rethrows -> T {
        var copy = self
        return try block(&copy)
    }

    func also(_ block: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try block(&copy)
        return copy
    }

    func takeIf(_ predicate: (Self) -> Bool) -> Self? {
        predicate(self) ? self : nil
    }

    func takeUnless(_ predicate: (Self) -> Bool) -> Self? {
        !predicate(self) ? self : nil
    }
}

extension NSObject: Extensible {}

extension CGPoint: Extensible {}
extension CGRect: Extensible {}
extension CGSize: Extensible {}
extension CGVector: Extensible {}

extension Array: Extensible {}
extension Dictionary: Extensible {}
extension Set: Extensible {}

#if os(iOS) || os(tvOS)
  extension UIEdgeInsets: Extensible {}
  extension UIOffset: Extensible {}
  extension UIRectEdge: Extensible {}
#endif
