import 'dart:developer';
import 'dart:io';
import 'dart:convert';

class Person {
  late String name;
  late int id;
  late String address;
  late int age;

  Person(this.name, this.id, this.address, this.age);
  void printData() {
    print(
        "this person's: name - $name , id - $id ,address - $address ,age - $age");
  }
}

class Student extends Person {
  late String email;
  late String phoneNum;
  late Map subjects;
  Student(super.name, super.id, super.address, super.age, this.email,
      this.phoneNum, this.subjects);

  @override
  void printData() {
    print(
        "this student's: name - $name , id - $id ,address - $address ,age - $age ,Email - $email , Phone - $phoneNum ,");
    print("Grades :");
    subjects.forEach((key, value) => print("$key - $value"));
  }
}

class Students {
  List<Map> students = [];
  addStudent(
      /*{required name,
      required id,
      required address,
      required age,
      required email,
      required phoneNum,
      required subjects}*/
      ) {
    print("name");
    String name = stdin.readLineSync()!;
    print("id");
    var id = stdin.readLineSync()!;
    print("address");
    String address = stdin.readLineSync()!;
    print("age");
    int age = int.parse(stdin.readLineSync()!);
    print("email");
    String email = stdin.readLineSync()!;
    print("phone number");
    String phoneNum = stdin.readLineSync()!;
    print('enter each subject and its grade - e.g: {"math":25,"english":23}');
    var subjects = stdin.readLineSync()!;
    Map valueMap = json.decode(subjects);
    students.add({
      "name": name,
      "id": id,
      "address": address,
      "age": age,
      "email": email,
      "phoneNum": phoneNum,
      "subjects": valueMap
    });
  }

  removeStudent(id) {
    var index1 = students.indexWhere((element) => element["id"] == id);
    if (index1 != -1) {
      students.removeAt(index1);
    }
  }

  updateStudent(id) {
    var index1 = students.indexWhere((element) => element["id"] == id);
    var input;
    if (index1 != -1) {
      print("which data you want to update :");
      print("1.name");
      print("2.id");
      print("3.address");
      print("4.age");
      print("5.email");
      print("6.phoneNum");
      print("7.subjucts");

      input = stdin.readLineSync();

      switch (input) {
        case "1":
          print("Enter the new data");
          var input1 = stdin.readLineSync();
          students[index1].update("name", (value) => input1);
          break;
        case "2":
          print("Enter the new data");
          var input1 = stdin.readLineSync();
          students[index1].update("id", (value) => input1);
          break;
        case "3":
          print("Enter the new data");
          var input1 = stdin.readLineSync();
          students[index1].update("address", (value) => input1);
          break;
        case "4":
          print("Enter the new data");
          var input1 = stdin.readLineSync();
          students[index1].update("age", (value) => input1);
          break;
        case "5":
          print("Enter the new data");
          var input1 = stdin.readLineSync();
          students[index1].update("email", (value) => input1);
          break;
        case "6":
          print("Enter the new data");
          var input1 = stdin.readLineSync();
          students[index1].update("phoneNum", (value) => input1);
          break;
        case "7":
          print('Enter the new data as {"subj1":grade,"subj2":grade}');
          var input1 = stdin.readLineSync()!;
          Map valueMap = json.decode(input1);
          students[index1].update("subjects", (value) => valueMap);
          print(valueMap.runtimeType);
          break;

        default:
          print("invalid");
      }
    } else {
      print("this id isn't available");
    }
  }

  calcStudent(id) {
    var index1 = students.indexWhere((element) => element["id"] == id);
    double grade = 0;
    if (index1 != -1) {
      Map m = students[index1]["subjects"];
      print(m);
      m.forEach((key, value) {
        grade += value;
      });

      if (grade > 50) {
        print("succeded | $grade");
      } else {
        print("failed | $grade");
      }
    }
  }

  void printData() {
    int c = 1;
    if (students.isEmpty == true) {
      print("you didn't add any students yet");
    } else {
      students.forEach((element) {
        print("$c Student $element");
        c++;
      });
    }
  }
}
