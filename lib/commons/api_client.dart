import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

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
  // @POST("devices/")
  // Future<bool> addDevice({required Map<String, String> data});
  //
  // @GET("devices/")
  // Future<List<Device>> getDevices();
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
  User? user;

  UserLoginResponse({
    this.user,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => _$UserLoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginResponseToJson(this);
}
