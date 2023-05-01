import Foundation

struct DataModel: Codable {
    var data: QuestionModel?
}

struct QuestionModel: Codable {
    var questions: [Questions]?
}

struct Questions: Codable {
    var correctAnswer: String?
    var option1: String?
    var option2: String?
    var option3: String?
    var option4: String?
    var question: String?
}
