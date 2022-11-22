import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:vehicle_alert/commons/objects/alert.dart';
import 'package:vehicle_alert/commons/objects/contact.dart';

import 'objects/user.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://cas.click7solutions.com/main/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("login/")
  Future<UserLoginResponse> loginUser(@Body() SendDataLogin sendDataLogin);

  @POST("add_user/")
  Future<UserLoginResponse> addUser(@Body() SendDataSignup sendDataSignup);

  // @GET("items/")
  // Future<List<ImagesAndVideos>> getImagesAndVideos();
  //
  // @POST("items/")
  // Future<bool> uploadFile({required XFile file, @required Function(int, int)? sendProgress});
  //
  // @POST("playlists/")
  // Future<bool> uploadCarouselPlayList({required Map<String, dynamic> data});
  //
  // @PUT("item/")
  // Future<bool> updateLabel({required String newData, required String id});
  //

  @GET("alerts/")
  Future<List<Alert>> getAlerts(
      @Header('Authorization') String token,
      );

  @GET("contacts/")
  Future<List<Contact>> getContacts(
      @Header('Authorization') String token,
      );
}
@JsonSerializable()
class SendDataSignup {
  String? username;
  String? password;
  String? email;

  SendDataSignup({
    this.username,
    this.password,
    this.email,
  });

  factory SendDataSignup.fromJson(Map<String, dynamic> json) => _$SendDataSignupFromJson(json);
  Map<String, dynamic> toJson() => _$SendDataSignupToJson(this);
}


@JsonSerializable()
class SendDataLogin {
  String? username;
  String? password;

  SendDataLogin({
    this.username,
    this.password,
  });

  factory SendDataLogin.fromJson(Map<String, dynamic> json) => _$SendDataLoginFromJson(json);
  Map<String, dynamic> toJson() => _$SendDataLoginToJson(this);
}

@JsonSerializable()
class UserLoginResponse {
  String? token ;
  User? user;

  UserLoginResponse({
    this.user,
    this.token,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => _$UserLoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginResponseToJson(this);
}
