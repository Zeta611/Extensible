import XCTest

import ExtensibleTests

var tests = [XCTestCaseEntry]()
tests += ExtensibleTests.allTests()
XCTMain(tests)
