import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  // String test2res=task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// String task2() {
//   Duration thesec = Duration(seconds: 3);

//   // sleep(thesec);
//   String result='';

//   Future.delayed(thesec, () {
//      result = 'task 2 data';
//     print('Task 2 complete');
//   });
// }

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}
