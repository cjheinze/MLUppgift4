//
//  DoModel.swift
//  basicML
//
//  Created by BillU on 2023-09-18.
//

import Vision
import Foundation
import UIKit

class DoModel {
    
    func classifyImage(imageName: String) -> (label: String, probability: Double)? {
        
        let defaultConfig = MLModelConfiguration()

        // Create an instance of the image classifier's wrapper class.
        let imageClassifierWrapper = try? SqueezeNet(configuration: defaultConfig)
        
        guard let imageClassifier = imageClassifierWrapper else {
            return nil
        }
        
        guard let image = UIImage(named: imageName)?.cgImage else {
            return nil
        }
        
        do {
            let output = try imageClassifier.prediction(input: SqueezeNetInput(imageWith: image))
            
            print(output.classLabel)
            print(output.classLabelProbs[output.classLabel]!)
            return (output.classLabel, output.classLabelProbs[output.classLabel]!)
        } catch {
            // error
            return nil
        }
    }
}


