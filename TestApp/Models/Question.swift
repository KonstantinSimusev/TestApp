//
//  Question.swift
//  TestApp
//
//  Created by Konstantin Simusev on 02.07.2022.
//

import UIKit

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
    
    static func getPackerQuestions() -> [Question] {
        [
            Question(
                title: "Что делает укладчик-упаковщик?",
                type: .single,
                answers: [
                    Answer(title: "Спит", type: false),
                    Answer(title: "Сидит", type: false),
                    Answer(title: "Пакует", type: true)
                ]
            ),
            Question(
                title: "Что пакует укладчик-упаковщик?",
                type: .multiple,
                answers: [
                    Answer(title: "Бутылки", type: false),
                    Answer(title: "Пачки", type: true),
                    Answer(title: "Рулоны", type: true)
                ]
            )
        ]
    }
    
    static func getCutterQustions() -> [Question] {
        [
            Question(
                title: "Что делает резчик холодного металла?",
                type: .single,
                answers: [
                    Answer(title: "Спит", type: false),
                    Answer(title: "Сидит", type: false),
                    Answer(title: "Режет", type: true)
                ]
            ),
            Question(
                title: "Что режет резчик холодного металла?",
                type: .multiple,
                answers: [
                    Answer(title: "Бутылки", type: false),
                    Answer(title: "Металл", type: true),
                    Answer(title: "Пластик", type: true)
                ]
            )
        ]
    }
    
    static func getStackerQustions() -> [Question] {
        [
            Question(
                title: "Что делает штабелировщик металла?",
                type: .single,
                answers: [
                    Answer(title: "Спит", type: false),
                    Answer(title: "Сидит", type: false),
                    Answer(title: "Раскрепляет", type: true)
                ]
            ),
            Question(
                title: "Что раскрепляет штабелировщик металла?",
                type: .multiple,
                answers: [
                    Answer(title: "Бутылки", type: false),
                    Answer(title: "Пачки", type: true),
                    Answer(title: "Рулоны", type: true)
                ]
            )
        ]
    }
}
        
enum Employee: String, CaseIterable {
    case packer = "Укладчик-упаковщик"
    case cutter = "Резчик холодного металла"
    case stacker = "Штабелировщик металла"
}

enum ResponseType {
    case single
    case multiple
}

struct Answer {
    let title: String
    let type: Bool
}
