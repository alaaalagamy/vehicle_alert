// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendDataSignup _$SendDataSignupFromJson(Map<String, dynamic> json) =>
    SendDataSignup(
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$SendDataSignupToJson(SendDataSignup instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
    };

SendDataLogin _$SendDataLoginFromJson(Map<String, dynamic> json) =>
    SendDataLogin(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SendDataLoginToJson(SendDataLogin instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

UserLoginResponse _$UserLoginResponseFromJson(Map<String, dynamic> json) =>
    UserLoginResponse(
      user: User.fromJson(json),
    );

Map<String, dynamic> _$UserLoginResponseToJson(UserLoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://cas.click7solutions.com/main/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserLoginResponse> loginUser(sendDataLogin) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(sendDataLogin.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserLoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'login/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserLoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserLoginResponse> addUser(sendDataSignup) async {
    final _result = await _dio.post('${baseUrl}add_user/' , data: sendDataSignup.toJson());

    final value = UserLoginResponse.fromJson(_result.data!);
    print(value);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
