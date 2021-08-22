//
//  RatingSymbolLine.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 25/07/2021.
//
//  This sub-View creates a row of Mickey Mouse heads as a Ratings line of */5

import SwiftUI

struct RatingSymbolLine: View {
    
    var GUISize = GUISizes()

    let RSIColor = "#E3BB4A"
    let wholeNumber: Int
    let half: Bool
    
    
    init(count: Double) {
        self.wholeNumber = Int(count)
        let remainder = count - Double(wholeNumber)
        if remainder != 0 && remainder != 1 {
            self.half = true
        } else {
            self.half = false
        }
    }
    
    
    
    var body: some View {
        HStack {
            ForEach(0..<self.wholeNumber) { _ in
                Image("goldenMickeyWhole")
                    .resizable()
                    .frame(width: 20, height: 20)
                
            }
            if self.half == true {
                Image("goldenMickeyHalf")
                    .resizable()
                    .frame(width: 10, height: 20)
            }
        }
        
    }
}

struct RatingSymbolLine_Previews: PreviewProvider {
    static var previews: some View {
        RatingSymbolLine(count: 4)
    }
}
