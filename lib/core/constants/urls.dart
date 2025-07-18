class Urls {
  ///use 10.0.2.2 -> for connecting emulator with the localhost backend ||Ip addr fro physical devices connected
  static const baseUrl = "http://10.0.2.2:9090/api/";

  static const jwtTokenUrl = "genToken";
  static const getExpenseUrl = "preloadData/getExpense";
  static const addExpenseUrl = "";
  static const deleteExpenseUrl = "";
  static const historyByPagination = "expenses/getAllExpensePagination";
}
