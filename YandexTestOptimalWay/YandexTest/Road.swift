//
//  Road.swift
//  YandexTest
//
//  Created by Анна Качкаева on 27.07.2021.
//

import Foundation

class Road{
    var steps = [(way: String, distace: Int)]()
    var wasChanged = false
    
    func makeOpti(){
        wasChanged = false
        for index in steps.indices{
            if steps.indices.count - 1 > index {
                compareTwo(steps[index], steps[index+1], index)
            }
        }
        print(steps)
        
        if wasChanged {
            makeOpti()
        }
    }


    func add(_ first: (way: String, distace: Int), _ secound: (way: String, distace: Int), _ index: Int) -> (){
        wasChanged = true

        let summ = first.distace + secound.distace
        steps.remove(at: index+1)

        steps[index] = (first.way, summ)
    }
    
    func compare(_ first: (way: String, distace: Int), _ secound: (way: String, distace: Int), _ index: Int) -> (){
        wasChanged = true

        let diff = first.distace - secound.distace
        
        switch diff{
        case 1...:
            steps.remove(at: index+1)
            steps[index] = (first.way , diff)
        case 0:
            steps.remove(at: index+1)
            steps.remove(at: index)
        case ...0:
            steps[index] = (secound.way, diff  * (-1))
            steps.remove(at: index+1)
        default:
            break
        }
        
    }
    
    func compareTwo(_ first: (way: String, distace: Int), _ secound: (way: String, distace: Int), _ index: Int){
        
        let firstStep : (way: String, distace: Int) = first
        let secondStep : (way: String, distace: Int) = secound
        
        switch firstStep.way {
        case "TOP":
            if secondStep.way == "TOP" {
                print("top-top")
                add(firstStep, secondStep, index)
            } else if secondStep.way == "BOTTOM" {
                print("top-bottom")
                compare(firstStep, secondStep, index)
            }
        case "BOTTOM":
            if secondStep.way == "BOTTOM" {
                print("bottom-bottom")
                add(firstStep, secondStep, index)
            } else if secondStep.way == "TOP" {
                print("bottom-top")
                compare(firstStep, secondStep, index)
            }
        case "LEFT":
            if secondStep.way == "LEFT" {
                print("left-left")
                add(firstStep, secondStep, index)
            } else if secondStep.way == "RIGHT" {
                print("left-right")
                compare(firstStep, secondStep, index)
            }
        case "RIGHT":
            if secondStep.way == "RIGHT" {
                print("right-right")
                add(firstStep, secondStep, index)
            } else if secondStep.way == "LEFT" {
                print("right-left")
                compare(firstStep, secondStep, index)
            }
            
        default:
            break
        }
        
    }
}
