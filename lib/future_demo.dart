void main() {
  performTasks();
}

void performTasks() async {
  task1();
  // String? resultTask2 = await task2();
  task2().then((value) => print('ddd'));
  print('tttttt');
  // task3(resultTask2)
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String?> task2() async {
  String? result;
  Duration duration = Duration(seconds: 2);
  await Future.delayed(duration, () {
    result = 'uuuu';
    print('Task 2 complete');
  });
  return result;
}

void task3(String? data) {
  String result = 'task 3 data';
  print('Task 3 complete $data');
}
