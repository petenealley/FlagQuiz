//
//  CountryFlag.swift
//  FlagQuiz
//
//  Created by Pete Nealley on 5/18/24.
//

import Foundation

struct CountryFlagData {
    let countryCodes = Locale.Region.isoRegions.filter {$0.subRegions.isEmpty}.map {$0.identifier}
    var countryNames: [String]
    var countryFlags: [String]
    
    func generateCountryFlag(_ countryCode: String) -> String {
        String(String.UnicodeScalarView(countryCode.unicodeScalars.compactMap {
            UnicodeScalar(127397 + $0.value)
        }))
    }
    
    func generateCountryNames(_ countryCode: String) -> String {
        let countryName = (Locale.current.localizedString(forRegionCode: countryCode) ?? "")
        return countryName
    }
    
    mutating func generateCountryNamesArray() -> [String] {
        for countryCode in countryCodes {
            let countryName = generateCountryNames(countryCode)
            countryNames.append(countryName)
        }
        return countryNames
    }
    
    mutating func generateCountryFlagsArray() -> [String] {
        for countryCode in countryCodes {
            let countryFlag = generateCountryFlag(countryCode)
            countryFlags.append(countryFlag)
        }
        return countryFlags
    }
}
