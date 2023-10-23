//
//  ContentView.swift
//  MLUppgift4
//
//  Created by Carl-Johan Heinze on 2023-10-18.
//

import SwiftUI

struct ContentView: View {
    let model = DoModel()
    
    @State var image1 = ImageClassification(imageName: "panda")
    @State var image2 = ImageClassification(imageName: "red_panda")
    
    var body: some View {
        VStack {
            HStack {
                viewForClassification(image1)
                viewForClassification(image2)
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func viewForClassification(_ imageClassification: ImageClassification) -> some View {
        VStack {
            Image(imageClassification.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button("Analysera") {
                let results = model.classifyImage(imageName: imageClassification.imageName)
                imageClassification.classification = results?.label
                imageClassification.probablity = results?.probability
            }
            .buttonStyle(.borderedProminent)
            if let label = imageClassification.classification {
                let labels = label.split(separator: ",").map(\.capitalized)
                ForEach(labels, id: \.self) { label in
                    Text(label)
                }
                
            }
            if let probability = imageClassification.probablity {
                Text(
                    probability,
                    format: .percent.precision(
                        .significantDigits(6)
                    )
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
