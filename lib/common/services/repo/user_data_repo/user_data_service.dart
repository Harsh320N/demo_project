import 'package:user_listing_with_signup_demo/common/model/user_list_model.dart';
import 'package:user_listing_with_signup_demo/common/services/api_handler.dart';
import 'package:user_listing_with_signup_demo/network/api_utils.dart';

class UserDataRepo {
  ///User List Service
  static Future<List<UserListModel>?> userListService(
    int page,
    int pageSize,
  ) async {
    String totalNumberOfResult = "100";
    String totalNumberOfPage = "10";
    String currentPage = page.toString();
    String resultPerPage = pageSize.toString();

    var responseBody = await API.apiHandler(
      url: "${ApiUtils.userDataUrl}?page=$page&per_page=$pageSize",
      requestType: RequestType.get,
      totalNumberOfResult: totalNumberOfResult,
      totalNumberOfPage: totalNumberOfPage,
      currentPage: currentPage,
      resultPerPage: resultPerPage,
      showLoader: false,
    );
    if (responseBody != null) {
      return  List<UserListModel>.from(responseBody.map((x) => UserListModel.fromJson(x)));
    }
    return null;
  }
}
