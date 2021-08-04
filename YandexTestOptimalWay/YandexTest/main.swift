//
//  main.swift
//  YandexTest
//
//  Created by Анна Качкаева on 26.07.2021.
//

import Foundation

var step: Dictionary<String, Int>
var end = false

var road = Road()
while(!end){
    let next = readLine()
    road.steps.append(fromStringToTuple(next ?? ""))
    
    road.makeOpti()

//    let next = readLine()
//    if next != "000" {
//        road.steps.append(fromStringToTuple(next ?? ""))
//    } else {
//        end = true
//    }
}

//road.makeOpti()


func fromStringToTuple(_ str: String) -> (way: String, distace: Int) {
    let arr = str.components(separatedBy: " ")

    if arr.count > 1 /*, arr[1] != nil*/ {
        return (arr[0], Int(arr[1]) ?? 0)
    } else {
        return ("?" , 0)
    }
}






