import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  Future<void> addData(userData) async {
    FirebaseFirestore.instance
        .collection("users")
        .add(userData)
        .catchError((e) {
      print(e);
    });
  }

  getData() {
    return FirebaseFirestore.instance.collection("users").snapshots();
  }

  bool addQuizData(Map<String, dynamic> quizData, String quizId) {
    bool isQuizDataAdded = false;
    FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .then((value) => isQuizDataAdded = true)
        .onError((error, stackTrace) {
      print("AN ERROR OCCURED ${error.toString()}");
      isQuizDataAdded = false;
      return isQuizDataAdded;
    });
    return isQuizDataAdded;
  }

  bool addQuestionData(quizData, String quizId) {
    bool isQuestionDataAdded = false;
    FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(quizData)
        .then((value) => isQuestionDataAdded=true)
        .onError((e,t) {
      isQuestionDataAdded = false;
      print(e);
      return isQuestionDataAdded;
    });
    return isQuestionDataAdded;
  }

  getQuizData() {
    return FirebaseFirestore.instance.collection("Quiz").snapshots();
  }

  getQuestionData(String quizId)  {
    return FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }
}
