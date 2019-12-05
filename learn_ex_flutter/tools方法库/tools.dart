class MyTools {
  // 比较两个日期的差
  _diffDate() {
    final birthday = DateTime(2019, 11, 13);
    final date2 = DateTime.now();
    final differenceDay = date2.difference(birthday).inDays;
    final differenceinHours = date2.difference(birthday).inHours;
    print(differenceDay);
    print(differenceinHours);
  }
}
