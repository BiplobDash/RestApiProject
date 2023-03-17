import 'dart:convert';
import 'package:crudd_app/Style/style.dart';
import 'package:http/http.dart' as http;

Future<List> productGridListRequest() async {
  var url = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.get(url, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast('Request Success');
    return resultBody['data'];
  } else {
    ErrorToast('Request fail ! try agin');
    return [];
  }
}

Future<bool> productCreateRequest(formValues) async {
  var url = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
  var postBody = json.encode(formValues);
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.post(url, body: postBody, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast('Request Success');
    return true;
  } else {
    ErrorToast('Request fail ! try agin');
    return false;
  }
}

Future<bool> productDeletedRequest(id) async{
  var url = Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/'+id);
   var postHeader = {"Content-Type": "application/json"};
  var response = await http.get(url, headers: postHeader);
var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast('Request Success');
    return true;
  } else {
    ErrorToast('Request fail ! try agin');
    return false;
  }

}


Future<bool> productUpdateRequest(formValues, id) async {
  var url = Uri.parse('https://crud.teamrabbil.com/api/v1/UpdateProduct/'+id);
  var postBody = json.encode(formValues);
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.post(url, body: postBody, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast('Request Success');
    return true;
  } else {
    ErrorToast('Request fail ! try agin');
    return false;
  }
}