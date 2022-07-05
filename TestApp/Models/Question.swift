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
    
    func getShuffledAnswers(_ answers: [Answer]) -> [Answer] {
        answers.shuffled()
    }
    
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
                    Answer(title: "Чемоданы", type: false),
                    Answer(title: "Рулоны", type: true),
                    Answer(title: "Пачки", type: true)
                ]
            ),
            Question(
                title: "Что собирает укладчик-упаковщик?",
                type: .multiple,
                answers: [
                    Answer(title: "Бутылки", type: false),
                    Answer(title: "Мусор", type: true),
                    Answer(title: "Монеты", type: false)
                ]
            ),
            Question(
                title: "Что учит укладчик-упаковщик?",
                type: .single,
                answers: [
                    Answer(title: "Стихотворение", type: false),
                    Answer(title: "Астрофизику", type: false),
                    Answer(title: "Схемы", type: true)
                ]
            ),
            Question(
                title: "Что знает укладчик-упаковщик?",
                type: .single,
                answers: [
                    Answer(title: "Будущее", type: false),
                    Answer(title: "Прошлое", type: false),
                    Answer(title: "Инструкцию", type: true)
                ]
            ),
            Question(
                title: "Что пишет укладчик-упаковщик?",
                type: .multiple,
                answers: [
                    Answer(title: "Реп", type: false),
                    Answer(title: "Объяснительную", type: true),
                    Answer(title: "Заявление", type: true)
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
                    Answer(title: "Колбасу", type: false),
                    Answer(title: "Металл", type: true),
                    Answer(title: "Пластик", type: true)
                ]
            ),
            Question(
                title: "Что собирает резчик холодного металла?",
                type: .multiple,
                answers: [
                    Answer(title: "Бутылки", type: false),
                    Answer(title: "Мусор", type: true),
                    Answer(title: "Монеты", type: false)
                ]
            ),
            Question(
                title: "Что учит резчик холодного металла?",
                type: .single,
                answers: [
                    Answer(title: "Стихотворение", type: false),
                    Answer(title: "Астрофизику", type: false),
                    Answer(title: "Схемы", type: true)
                ]
            ),
            Question(
                title: "Что знает резчик холодного металла?",
                type: .single,
                answers: [
                    Answer(title: "Будущее", type: false),
                    Answer(title: "Прошлое", type: false),
                    Answer(title: "Инструкцию", type: true)
                ]
            ),
            Question(
                title: "Что пишет резчик холодного металла?",
                type: .multiple,
                answers: [
                    Answer(title: "Реп", type: false),
                    Answer(title: "Объяснительную", type: true),
                    Answer(title: "Заявление", type: true)
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
                    Answer(title: "Листы", type: true),
                    Answer(title: "Пачки", type: true),
                    Answer(title: "Рулоны", type: true)
                ]
            ),
            Question(
                title: "Что собирает штабелировщик металла?",
                type: .multiple,
                answers: [
                    Answer(title: "Бутылки", type: false),
                    Answer(title: "Мусор", type: true),
                    Answer(title: "Монеты", type: false)
                ]
            ),
            Question(
                title: "Что учит штабелировщик металла?",
                type: .single,
                answers: [
                    Answer(title: "Стихотворение", type: false),
                    Answer(title: "Астрофизику", type: false),
                    Answer(title: "Схемы", type: true)
                ]
            ),
            Question(
                title: "Что знает штабелировщик металла?",
                type: .single,
                answers: [
                    Answer(title: "Будущее", type: false),
                    Answer(title: "Прошлое", type: false),
                    Answer(title: "Инструкцию", type: true)
                ]
            ),
            Question(
                title: "Что пишет штабелировщик металла?",
                type: .multiple,
                answers: [
                    Answer(title: "Реп", type: false),
                    Answer(title: "Объяснительную", type: true),
                    Answer(title: "Заявление", type: true)
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
