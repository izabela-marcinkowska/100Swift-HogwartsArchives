//
//  Student.swift
//  HogwartsArchives
//
//  Created by Izabela Marcinkowska on 2024-10-25.
//

import Foundation
import SwiftData

@Model
class Student : Codable {
    var id: UUID
    var name: String
    var alternate_names: [String]
    var species: String
    var gender: String
    var house: String
    var dateOfBirth: Date
    var yearOfBirth: Int
    var wizard: Bool
    var ancestry: String
    var eyeColour: String
    var hairColour: String
    var wand: [Wand]
    var patronus: String
    var hogwartsStudent: Bool
    var hogwartsStaff: Bool
    var actor: String
    var alternate_actors: [String]
    var alive: Bool
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case alternateNames = "alternate_names"
        case species
        case gender
        case house
        case dateOfBirth
        case yearOfBirth
        case wizard
        case ancestry
        case eyeColour
        case hairColour
        case wand
        case patronus
        case hogwartsStudent
        case hogwartsStaff
        case actor
        case alternateActors = "alternate_actors"
        case alive
        case image
    }
    
    init(id: UUID, name: String, alternate_names: [String], species: String, gender: String, house: String, dateOfBirth: Date, yearOfBirth: Int, wizard: Bool, ancestry: String, eyeColour: String, hairColour: String, wand: [Wand], patronus: String, hogwartsStudent: Bool, hogwartsStaff: Bool, actor: String, alternate_actors: [String], alive: Bool, image: String) {
        self.id = id
        self.name = name
        self.alternate_names = alternate_names
        self.species = species
        self.gender = gender
        self.house = house
        self.dateOfBirth = dateOfBirth
        self.yearOfBirth = yearOfBirth
        self.wizard = wizard
        self.ancestry = ancestry
        self.eyeColour = eyeColour
        self.hairColour = hairColour
        self.wand = wand
        self.patronus = patronus
        self.hogwartsStudent = hogwartsStudent
        self.hogwartsStaff = hogwartsStaff
        self.actor = actor
        self.alternate_actors = alternate_actors
        self.alive = alive
        self.image = image
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        alternate_names = try container.decode([String].self, forKey: .alternateNames)
        species = try container.decode(String.self, forKey: .species)
        gender = try container.decode(String.self, forKey: .gender)
        house = try container.decode(String.self, forKey: .house)
        dateOfBirth = try container.decode(Date.self, forKey: .dateOfBirth)
        yearOfBirth = try container.decode(Int.self, forKey: .yearOfBirth)
        wizard = try container.decode(Bool.self, forKey: .wizard)
        ancestry = try container.decode(String.self, forKey: .ancestry)
        eyeColour = try container.decode(String.self, forKey: .eyeColour)
        hairColour = try container.decode(String.self, forKey: .hairColour)
        wand = try container.decode([Wand].self, forKey: .wand)
        patronus = try container.decode(String.self, forKey: .patronus)
        hogwartsStudent = try container.decode(Bool.self, forKey: .hogwartsStudent)
        hogwartsStaff = try container.decode(Bool.self, forKey: .hogwartsStaff)
        actor = try container.decode(String.self, forKey: .actor)
        alternate_actors = try container.decode([String].self, forKey: .alternateActors)
        alive = try container.decode(Bool.self, forKey: .alive)
        image = try container.decode(String.self, forKey: .image)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(alternate_names, forKey: .alternateNames)
        try container.encode(species, forKey: .species)
        try container.encode(gender, forKey: .gender)
        try container.encode(house, forKey: .house)
        try container.encode(dateOfBirth, forKey: .dateOfBirth)
        try container.encode(yearOfBirth, forKey: .yearOfBirth)
        try container.encode(wizard, forKey: .wizard)
        try container.encode(ancestry, forKey: .ancestry)
        try container.encode(eyeColour, forKey: .eyeColour)
        try container.encode(hairColour, forKey: .hairColour)
        try container.encode(wand, forKey: .wand)
        try container.encode(patronus, forKey: .patronus)
        try container.encode(hogwartsStudent, forKey: .hogwartsStudent)
        try container.encode(hogwartsStaff, forKey: .hogwartsStaff)
        try container.encode(actor, forKey: .actor)
        try container.encode(alternate_actors, forKey: .alternateActors)
        try container.encode(alive, forKey: .alive)
        try container.encode(image, forKey: .image)
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

@Model
class Wand: Codable {
    var wood: String
    var core: String
    var length: Int
    
    enum CodingKeys: String, CodingKey {
        case wood
        case core
        case length
    }
    
    init(wood: String, core: String, length: Int) {
        self.wood = wood
        self.core = core
        self.length = length
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        wood = try container.decode(String.self, forKey: .wood)
        core = try container.decode(String.self, forKey: .core)
        length = try container.decode(Int.self, forKey: .length)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(wood, forKey: .wood)
        try container.encode(core, forKey: .core)
        try container.encode(length, forKey: .length)
    }
    
    static func == (lhs: Wand, rhs: Wand) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
