import 'package:get/get.dart';
import 'package:nh_food_delivery/data/api/api_client.dart';
import 'package:nh_food_delivery/models/place_order_model.dart';
import 'package:nh_food_delivery/utils/app_constants.dart';

class OrderRepo{
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});

  Future<Response> placeOrder(PlaceOrderBody placeOrderBody) async{
    return await apiClient.postData(AppConstants.PLACE_ORDER_URI, placeOrderBody.toJson());
  }

  Future<Response> getOrderList() async{
    return await apiClient.getData(AppConstants.ORDER_LIST_URI);
  }
}