//
//  GetNominationsAPI.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Foundation

class NominationsAPI {

    static let shared = NominationsAPI()

    var urlSession: URLSession
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    // MARK: - Fetch Search result requst
    // Used generics to make it as reusable
    func getAllData<T: Decodable>(url: String, _ mapType: T.Type, completion: @escaping (_ response: T?,
                                                                                      _ code: Int?,
                                                                                      _ error: Error?) -> Void) {

        guard let url = URL(string: url) else { return }
        let token = KeychainWrapper.shared.readAuthTokenFromKeychain()

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // Set the Authorization header for the token
        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")

        let task = urlSession.dataTask(with: request) { data, response, error in

            let httpResponse = response as? HTTPURLResponse

            do {
                if error == nil {
                    let data = data ?? Data()
                    let decoder = JSONDecoder()

                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
                    let response = try decoder.decode(T.self, from: jsonData)

                    completion(response, httpResponse?.statusCode, nil)
                } else {
                    completion(nil, httpResponse?.statusCode, error)
                }
            } catch {
                completion(nil, httpResponse?.statusCode, error)
            }
        }
        task.resume()
    }

    func createNominationAPI(nomineeId: String, reason: String, process: String, completion: @escaping (_ response: CreateNominationResponse?,
                                                                                     _ code: Int?,
                                                                                     _ error: Error?) -> Void) {

        guard let url = URL(string: "https://cube-academy-api.cubeapis.com/api/nomination") else { return }
        let token = KeychainWrapper.shared.readAuthTokenFromKeychain()



            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = [URLQueryItem(name: "nominee_id", value: nomineeId),
                                      URLQueryItem(name: "reason", value: reason),
                                      URLQueryItem(name: "process", value: process)]

            guard let finalURL = components?.url else {
                completion(nil, nil, NSError(domain: "URL Error", code: -1, userInfo: nil))
                return
            }

            var request = URLRequest(url: finalURL)
            request.httpMethod = "POST"

            if let token = token {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }

        let task = urlSession.dataTask(with: request) { data, response, error in

            let httpResponse = response as? HTTPURLResponse

            do {
                if error == nil {
                    let data = data ?? Data()
                    let decoder = JSONDecoder()

                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
                    let response = try decoder.decode(CreateNominationResponse.self, from: jsonData)
                    
                    completion(response, httpResponse?.statusCode, nil)
                } else {
                    completion(nil, httpResponse?.statusCode, error)
                }
            } catch {
                completion(nil, httpResponse?.statusCode, error)
            }
        }
        task.resume()
    }

}
