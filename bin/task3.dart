import 'package:task3/classes.dart';
import 'package:task3/task3.dart' as task3;
import 'dart:io';


void main(List<String> arguments) {
  Person p = Person("Salma", 1287, "22st", 20);
  Student s = Student("Salma", 1287, "22st", 20, "salma@gmail.com","01268567759", {"math": 16, "english": 19, "bio": 17});
  Students ss = Students();

  bool x = true;

  while (x) {
    print("what process you want to do:");
    print("1.print data");
    print("2.add student");
    print("3.remove student");
    print("4.update student");
    print("5.student's results");
    print("6.exit");
    var n = stdin.readLineSync();
    switch (n) {
      case "1":
        print("which data you want to print:");
        print("1.Person: name,id,address,age");
        print(git init"2.Student: name,id,address,age,email,phone number,subjects and their grade");
        print("3.Students: all the students data");
        var n1 = stdin.readLineSync();
        switch (n1) {
          case "1":
            p.printData();
            break;
          case "2":
            s.printData();
            break;
          case "3":
            ss.printData();
            break;
        }
        break;
      case "2":
        ss.addStudent();
        break;
      case "3":
        print("Enter student's id you want to remove :");
        var n1 = stdin.readLineSync();
        ss.removeStudent(n1);
        
        break;
      case "4":
        print("Enter student's id you want to update :");
        var n1 = stdin.readLineSync();
        ss.updateStudent(n1);
        break;
      case "5":
        print("Enter student's id to show the result :");
        var n1 = stdin.readLineSync();
        ss.calcStudent(n1);
        break;
      case "6":
        x = false;
        break;
    }
  }
}
