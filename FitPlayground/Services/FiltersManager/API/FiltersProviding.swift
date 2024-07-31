//
//  FiltersProviding.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

protocol FiltersProviding {
    var selectedFilters: ValuePublisher<Int> { get }
}
