void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String fresult = await task2();
  task3(fresult);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result;
  Duration sec = Duration(seconds: 3);
  await Future.delayed(sec, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String fresult) {
  String result = 'task 3 data';
  print('Task 3 complete $fresult');
}
