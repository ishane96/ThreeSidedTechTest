//
//  ThreeSidedTechTestTests.swift
//  ThreeSidedTechTestTests
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import XCTest
@testable import ThreeSidedTechTest

final class ThreeSidedTechTestTests: XCTestCase {

    override func tearDown() {
        URLProtocol.unregisterClass(URLProtocolMock.self)
        super.tearDown()
    }

    func testSearchListGetAPISuccess() {

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let urlSession = URLSession(configuration: config)
        // swiftlint:disable:next line_length
        let jsonString = "{\"data\":[{\"nomination_id\":\"9a70ab18-d70d-4ec2-8741-2ce7c63ad162\",\"nominee_id\":\"9a4bd093-e74c-4918-87cc-0c689cca78bf\",\"reason\":\"aaaaaa\",\"process\":\"fair\",\"date_submitted\":\"2023-10-23\",\"closing_date\":\"2023-10-23\"}]}"
        URLProtocolMock.mockData = jsonString.data(using: .utf8)

        let sut = NominationsAPI(urlSession: urlSession)
        let expectation = XCTestExpectation(description: "Nomination Expectation")
        let url = "https://cube-academy-api.cubeapis.com/api/nomination"

        sut.getAllData(url: url, NominationResponse.self) { response, code, error in
            XCTAssertEqual(response?.data.first?.nomineeID, "9a4bd093-e74c-4918-87cc-0c689cca78bf")
            XCTAssertNil(error)

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 15)
    }
}
