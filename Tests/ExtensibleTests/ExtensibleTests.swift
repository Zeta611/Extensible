import XCTest
@testable import Extensible

final class ExtensibleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Extensible().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
