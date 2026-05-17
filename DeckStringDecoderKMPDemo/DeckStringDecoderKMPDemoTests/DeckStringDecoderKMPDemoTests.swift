import XCTest
@testable import DeckStringDecoderKMPDemo

final class DeckStringDecoderKMPDemoTests: XCTestCase {
    private enum TestFailure: Error {
        case decodeFailed
    }

    func testValidInputProducesSummary() throws {
        let model = try decodedModel(DeckStringDemoFixtures.standardDeckCode)

        XCTAssertEqual(model.formatText, "Standard")
        XCTAssertEqual(model.heroText, "7")
        XCTAssertEqual(model.mainCardCount, 30)
        XCTAssertEqual(model.sideboardCardCount, 0)
    }

    func testStandardDeckListRows() throws {
        let model = try decodedModel(DeckStringDemoFixtures.standardDeckCode)

        XCTAssertTrue(model.rows.allSatisfy { row in
            row.sideboardOwner == nil
        })
        XCTAssertEqual(model.rows.reduce(0) { $0 + $1.count }, 30)
        XCTAssertTrue(model.rows.contains(DeckCardRow(dbfId: 401, count: 2, source: .main)))
    }

    func testSideboardRowsAreMergedAndMarked() throws {
        let model = try decodedModel(DeckStringDemoFixtures.sideboardDeckCode)

        let sideboardRows = model.rows.filter { $0.sideboardOwner != nil }
        XCTAssertEqual(model.formatText, "Wild")
        XCTAssertEqual(model.mainCardCount, 40)
        XCTAssertEqual(model.sideboardCardCount, 3)
        XCTAssertEqual(sideboardRows.count, 3)
        XCTAssertEqual(sideboardRows.first?.sideboardOwner, 90749)
    }

    func testEncodeRoundTrip() throws {
        XCTAssertTrue(try DeckStringDemoDecoder.encodedRoundTripMatches(DeckStringDemoFixtures.standardDeckCode))
    }

    func testInvalidInputError() {
        XCTAssertEqual(
            DeckStringDemoDecoder.decode("InvalidBase64!@#"),
            .failure("Invalid base64 encoding in deck string")
        )
    }

    private func decodedModel(
        _ input: String,
        file: StaticString = #filePath,
        line: UInt = #line
    ) throws -> DeckDisplayModel {
        switch DeckStringDemoDecoder.decode(input) {
        case .success(let model):
            return model
        case .failure(let message):
            XCTFail("Expected decoded model, got error: \(message)", file: file, line: line)
            throw TestFailure.decodeFailed
        }
    }
}
