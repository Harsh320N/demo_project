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
          print("RES ------ $res");
          if (response.statusCode == 200) {
            print("200 ----- $res");
            return res;
          }  else if (response.statusCode == 201) {
            print("201");
          } else if (response.statusCode == 204) {
            print("204");
          }else if (response.statusCode == 304) {
            print("304");
          }else if (response.statusCode == 400) {
            print("400");
          }else if (response.statusCode == 401) {
            print("401");
          }else if (response.statusCode == 403) {
            print("403");
          }else if (response.statusCode == 404) {
            print("404");
          }else if (response.statusCode == 405) {
            print("405");
          }else if (response.statusCode == 415) {
            print("415");
          }else if (response.statusCode == 422) {
            print("422");
          }else if (response.statusCode == 429) {
            print("429");
          }else if (response.statusCode == 500) {
            print("500");
          }else if (response.statusCode == 401) {
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

  static signupHandler({
    required String url,
    RequestType requestType = RequestType.post,
    bool showLoader = true,
    dynamic body,
  }) async {
    try {
      if (await checkConnection()) {
        if (showLoader) LoadingOverlay.of().show();
        Map<String, String> header = {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${ApiUtils.myToken}",
          'Accept': "application/json",
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
          print("RES ------ $res");
          if (response.statusCode == 200) {
            print("200 ----- $res");
            return res;
          }  else if (response.statusCode == 201) {
            print("201");
          } else if (response.statusCode == 204) {
            print("204");
          }else if (response.statusCode == 304) {
            print("304");
          }else if (response.statusCode == 400) {
            print("400");
          }else if (response.statusCode == 401) {
            print("401");
          }else if (response.statusCode == 403) {
            print("403");
          }else if (response.statusCode == 404) {
            print("404");
          }else if (response.statusCode == 405) {
            print("405");
          }else if (response.statusCode == 415) {
            print("415");
          }else if (response.statusCode == 422) {
            print("422");
          }else if (response.statusCode == 429) {
            print("429");
          }else if (response.statusCode == 500) {
            print("500");
          }else if (response.statusCode == 401) {
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

/*
curl -i -H "Accept:application/json" -H "Content-Type:application/json" -H "Authorization: Bearer ACCESS-TOKEN" -XPOST "https://gorest.co.in/public/v2/users" -d '{"name":"Tenali Ramakrishna", "gender":"male", "email":"tenali.ramakrishna@15ce.com", "status":"active"}'
 */

/*
200: OK. Everything worked as expected.
201: A resource was successfully created in response to a POST request. The Location header contains the URL pointing to the newly created resource.
204: The request was handled successfully and the response contains no body content (like a DELETE request).
304: The resource was not modified. You can use the cached version.
400: Bad request. This could be caused by various actions by the user, such as providing invalid JSON data in the request body etc.
401: Authentication failed.
403: The authenticated user is not allowed to access the specified API endpoint.
404: The requested resource does not exist.
405: Method not allowed. Please check the Allow header for the allowed HTTP methods.
415: Unsupported media type. The requested content type or version number is invalid.
422: Data validation failed (in response to a POST request, for example). Please check the response body for detailed error messages.
429: Too many requests. The request was rejected due to rate limiting.
500: Internal server error. This could be caused by internal program errors.
 */