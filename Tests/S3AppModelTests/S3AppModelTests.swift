import XCTest
@testable import S3AppModel

class S3AppModelTests: XCTestCase {
    func testS3AppModel() {
        XCTAssertNil(PlaceS3())
        XCTAssertNil(UserS3())
    }


    static var allTests = [
        ("testS3AppModel", testS3AppModel),
    ]
}
