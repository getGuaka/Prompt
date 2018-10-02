import XCTest

import PromptTests

var tests = [XCTestCaseEntry]()
tests += PromptTests.allTests()
XCTMain(tests)