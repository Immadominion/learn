class Question {
  String? status;
  List<Questions>? questions;

  Question({this.status, this.questions});

  Question.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? question;
  Map<String, String>? options;
  String? correctAnswer;

  Questions({this.question, this.options, this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    if (json['options'] != null) {
      options = Map<String, String>.from(json['options']);
    } else {
      options = {};
    }
    correctAnswer = json['correctAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['options'] = options;
    data['correctAnswer'] = correctAnswer;
    return data;
  }
}
