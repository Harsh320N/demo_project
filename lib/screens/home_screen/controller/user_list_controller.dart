import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_listing_with_signup_demo/common/model/user_list_model.dart';
import 'package:user_listing_with_signup_demo/common/services/repo/user_data_repo/user_data_service.dart';

class UserListController extends GetxController {
  final int _pageSize = 10;

  List<UserListModel> _userListData = [];

  List<UserListModel> get userListData =>
      _userListData;

  set userListData(List<UserListModel> value) {
    _userListData = value;
    update();
  }

  PagingController<int, UserListModel> pagingController = PagingController(firstPageKey: 1);

  Future<void> userList(int pageKey) async {
    try {
      var newItems = await UserDataRepo.userListService(pageKey, _pageSize);
      if (newItems != null) {
        userListData = newItems;
        final isLastPage = userListData.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(userListData);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(userListData, nextPageKey);
        }
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
