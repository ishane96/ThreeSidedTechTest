//
//  KeyChainWrapper.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Security
import SwiftUI

class KeychainWrapper {

    static let shared = KeychainWrapper()

    func saveAuthTokenToKeychain(token: String) {
        let keychainItemIdentifier = "com.test.ThreeSidedTechTest" // Unique identifier for your token

        // Convert the token to Data for saving in the Keychain
        if let data = token.data(using: .utf8) {
            // Define the query parameters
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: keychainItemIdentifier,
                kSecValueData as String: data
            ]

            // Add the item to the Keychain
            let status = SecItemAdd(query as CFDictionary, nil)

            // Check if the operation was successful
            guard status == errSecSuccess else {
                if status == errSecDuplicateItem {
                    print("Token already exists in Keychain. Updating...")
                    updateAuthTokenInKeychain(token: token)
                } else {
                    print("Error saving token to Keychain: \(status)")
                }
                return
            }

            print("Token saved to Keychain")
        }
    }

    func updateAuthTokenInKeychain(token: String) {
        let keychainItemIdentifier = "com.test.ThreeSidedTechTest" // Same identifier used for saving

        // Convert the token to Data for saving in the Keychain
        if let data = token.data(using: .utf8) {
            // Define the query parameters
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: keychainItemIdentifier
            ]

            // Define the attributes to update
            let attributes: [String: Any] = [
                kSecValueData as String: data
            ]

            // Update the item in the Keychain
            let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)

            // Check if the operation was successful
            guard status == errSecSuccess else {
                print("Error updating token in Keychain: \(status)")
                return
            }

            print("Token updated in Keychain")
        }
    }

    func readAuthTokenFromKeychain() -> String? {
        let keychainItemIdentifier = "com.test.ThreeSidedTechTest" // Same identifier used for saving

        // Define the query parameters
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainItemIdentifier,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        guard status == errSecSuccess,
              let retrievedData = dataTypeRef as? Data,
              let token = String(data: retrievedData, encoding: .utf8) else {
            print("Error reading token from Keychain: \(status)")
            return nil
        }

        return token
    }
}
