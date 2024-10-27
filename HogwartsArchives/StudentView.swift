//
//  StudentView.swift
//  HogwartsArchives
//
//  Created by Izabela Marcinkowska on 2024-10-27.
//

import SwiftUI
import SwiftData

struct StudentView: View {
    @Environment(\.modelContext) private var modelContext
    let student: Student
    var body: some View {
        Text(student.name)
    }
}

#Preview {
    StudentView(student: Student(id: "qwe", name: "Bella", alternate_names: ["Bibbi"], species: "human", gender: "woman", house: "Slythering", dateOfBirth: "1994-07-07", yearOfBirth: 1994, wizard: true, ancestry: "human", eyeColour: "grey", hairColour: "black", wand: Wand(wood: "unciorn", core: "lala", length: 8), patronus: "cat", hogwartsStudent: true, hogwartsStaff: false, actor: "myself", alternate_actors: ["me"], alive: true, image: "https://ik.imagekit.io/hpapi/harry.jpg"))
        .modelContainer(for: [Student.self, Wand.self])
}
