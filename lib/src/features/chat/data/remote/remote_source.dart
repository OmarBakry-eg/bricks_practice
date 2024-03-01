  
  
  @override
  Future<OneConversationModel> getOneChat(
      String? token ) async {
    if (token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
    Result result = await _dio.get("chats",   token  , isLoading: false,);
    if (result is SuccessState) {
      return OneConversationModel.fromJson(result.value);
    } else if (result is ErrorState) {
      throw ServerException(
          message: result.msg.toString(), errorModel: result.errorModel);
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }         
  
    
  
  @override
  Future<OneConversationModel> getOneChat (String? token) async {
       
    if (token == null) {
      throw const EmptyCacheException(message: 'Missing token');
    }
     
    Result result = await _dio.get("chats",   token  , isLoading: false,  body: {
       
      "recipients" : dd,
       
      "recipients1" : dd2,
      
    } );
    if (result is SuccessState) {
      return OneConversationModel.fromJson(result.value);
    } else if (result is ErrorState) {
      throw ServerException(
          message: result.msg.toString(), errorModel: result.errorModel);
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }  