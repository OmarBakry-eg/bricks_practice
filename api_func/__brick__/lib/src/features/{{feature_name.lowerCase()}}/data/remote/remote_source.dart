  
  
  @override
  Future<{{model_name}}> {{func_name}} ({{#token}}String? token{{/token}}) async {
      {{#token}} 
    if (token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
    {{/token}} 
    Result result = await _dio.get("{{api_url}}", {{#token}}  token {{/token}} , isLoading: false, {{^emptyBody}} body: {
      {{#body}} 
      "{{key}}" : {{value}},
      {{/body}}
    } {{/emptyBody}});
    if (result is SuccessState) {
      return {{model_name}}.fromJson(result.value);
    } else if (result is ErrorState) {
      throw ServerException(
          message: result.msg.toString(), errorModel: result.errorModel);
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }