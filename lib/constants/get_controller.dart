import 'package:get/get.dart';
import 'package:money_manager/pages/add_expense.dart';

class StateController extends GetxController {
  Rx<ExpenseType> selectedExpense = ExpenseType.expense.obs;
  RxInt bottomSheetSelectedPageIndex = 0.obs;
}
