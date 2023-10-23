//
//  ImageClassification.swift
//  MLUppgift4
//
//  Created by Carl-Johan Heinze on 2023-10-18.
//

import Foundation

@Observable class ImageClassification: Identifiable {
    let imageName: String
    var classification: String? = nil
    var probablity: Double? = nil
    
    init(imageName: String) {
        self.imageName = imageName
    }
}
