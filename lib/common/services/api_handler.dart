import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_listing_with_signup_demo/common/widgets/widget_export.dart';
import 'package:user_listing_with_signup_demo/network/api_utils.dart';

enum RequestType { get, post }

class API {
  static late http.Response response;

  static apiHandler({
    required String url,
    RequestType requestType = RequestType.post,
    bool showLoader = true,
    dynamic body,
    String totalNumberOfResult = '',
    String totalNumberOfPage = '',
    String currentPage = '',
    String resultPerPage = '',
  }) async {
    try {
      if (await checkConnection()) {
        if (showLoader) LoadingOverlay.of().show();
        Map<String, String> header = {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${ApiUtils.myToken}",
          ///"x-pagination-total": totalNumberOfResult, // X-Pagination-Total total number of results.
          ///"x-pagination-pages": totalNumberOfPage, // X-Pagination-Pages total number of pages.
          ///"x-pagination-page": currentPage, // X-Pagination-Page current page number.
          ///"x-pagination-limit": resultPerPage, // X-Pagination-Limit results per page.
        };
        log("URl ===> $url");
        log("HEADER ===> $header");
        log("BODY ===> $body");
        if (requestType == RequestType.get) {
          response = await http.get(
            Uri.parse(url),
            headers: header,
          );
        } else {
          response =
              await http.post(Uri.parse(url), headers: header, body: body);
        }
        log("RETURN RESPONSE BODY CREATE ====== ${response.body}");
        if (showLoader) LoadingOverlay.of().hide();
        if (response.body.isNotEmpty) {
          var res = jsonDecode(response.body);
          if (response.statusCode == 200) {
            return res;
          } else if (response.statusCode == 401) {
            errorSnack("Something want wrong please try again!");
          } else {
            errorSnack("Something want wrong please try again!");
            return null;
          }
        } else {
          return null;
        }
      } else {
        errorSnack("Check your Internet Connection!");
        return null;
      }
    } catch (e) {
      debugPrint("ERROR FROM API CLASS $e");
    }
    return null;
  }
}
