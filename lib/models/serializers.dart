import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:flutter_redux_bp/models/models.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[ApiError, ApiSuccess, AppUser, AccessToken])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
