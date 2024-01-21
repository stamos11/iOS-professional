//
//  CurrencyFormatter.swift
//  Bankey
//
//  Created by stamoulis nikolaos on 21/1/24.
//
import UIKit


struct CurrencyFormatter {
    
    func makeAttrubutedCurrency(_ amount: Decimal) -> NSMutableAttributedString {
        
        let tuple = breakIntoDollarsAndCents(amount)
        return makeBalanceAttributed(dollars: tuple.0, cents: tuple.1)
    }
    // Converts 929466.23 > "929,466" "23"
    func breakIntoDollarsAndCents(_ amount: Decimal) -> (String, String) {
        let tuple = modf(amount.doubleValue)
        
        let dollars = convertDollar(tuple.0)
        let cents = convertCents(tuple.1)
        
        return (dollars, cents)
    }
    
    private func convertDollar(_ dollarPart: Double) -> String {
        
        let dollarWithDecimal = dollarsFormatted(dollarPart)
        // "$929,466,00
        let formatter = NumberFormatter()
        let decimalSeparator = formatter.decimalSeparator! // "."
        let dollarComponents = dollarWithDecimal.components(separatedBy: decimalSeparator) // "$929,466" "00"
        
        var dollars = dollarComponents.first! // "$929,466"
        dollars.removeFirst()// "929,466
        
        return dollars
    }
    // converts 0.23 > 23
    private func convertCents(_ centPart: Double) -> String {
        
        let cents: String
        if centPart == 0 {
            cents = "00"
        } else {
            cents = String(format: "%.0f", centPart * 100)
        }
        return cents
    }
    // Converts 929466 > $929,466.00
    func dollarsFormatted(_ dollars: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        
        if let result = formatter.string(from: dollars as NSNumber) {
            return result
        }
        return ""
    }
    
    private func makeBalanceAttributed(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarsSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarsSignAttributes)
        let dollarsString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarsString)
        rootString.append(centString)
        
        return rootString
    }
    
}
