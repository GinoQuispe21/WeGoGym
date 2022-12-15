//
//  RoutineDetailPresenter.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

class RoutineDetailPresenter : DetailRoutinePresenterProtocol{
    
    private let itemDetail: ItemRoutineDetailProtocol
    
    required init(itemDetail: ItemRoutineDetailProtocol) {
        self.itemDetail = itemDetail
    }
    
    func getName() -> String {
        return itemDetail.name
    }
    
    func getAuthor() -> String {
        return itemDetail.author
    }
    
    func getDescription() -> String {
        return itemDetail.description
    }
    
    func getCountExcercises() -> Int {
        return itemDetail.countExcercises
    }
    
    func getTime() -> Int {
        return itemDetail.time
    }
    
    func getExcercises() -> [ExcerciseStruct] {
        return itemDetail.excercies
    }
    
}
