//
//  HealthDataLoader.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 28/05/24.
//

import Foundation

import HealthKit

class HealthKitManager {
    static let shared = HealthKitManager()
    
    let healthStore = HKHealthStore()
    
    let vitaminAType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminA)!
    let vitaminB6Type = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminB6)!
    let vitaminB12Type = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminB12)!
    let vitaminCType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminC)!
    let vitaminEType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminE)!
    let vitaminKType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminK)!
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let allTypes = Set([vitaminAType, vitaminB6Type, vitaminB12Type, vitaminCType, vitaminEType, vitaminKType])
        
        healthStore.requestAuthorization(toShare: nil, read: allTypes) { success, error in
            completion(success)
        }
    }
    
    func fetchVitaminData(for type: HKQuantityType, completion: @escaping (Double) -> Void) {
        let predicate = HKQuery.predicateForSamples(withStart: Date.distantPast, end: Date(), options: .strictEndDate)
        let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            completion(sum.doubleValue(for: HKUnit.gramUnit(with: .milli)))
        }
        healthStore.execute(query)
    }
}
