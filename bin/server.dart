// Copyright (c) 2018, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Dart implementation of the gRPC helloworld.Greeter server.
import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:helloworld/src/generated/sample.pbgrpc.dart';

class SampleService extends SampleServiceBase {
  @override
  Future<ListResponse> unaryGetList(
      ServiceCall call, GetRequest request) async {
    print('Server___$request Loading...');
    await Future.delayed(Duration(seconds: 5));
    print('Send data...');
    return ListResponse()
      ..list.addAll(['response 1', 'response 2', 'response 3', 'response 4']);
  }

  @override
  Stream<ListResponse> bIDirectionalStreamingGetList(
      ServiceCall call, Stream<GetRequest> request) async* {
    print('------------------------------------');
    print('Server___BID');

    await for (GetRequest getRequestItem in request) {
      yield ListResponse()..list.addAll(['$getRequestItem _Seen']);
    }
  }

  @override
  Future<ListResponse> clientStreamingGetList(
      ServiceCall call, Stream<GetRequest> request) async {
    print('------------------------------------');
    print('Server___Client Streaming');
    final response = ListResponse();
    await for (GetRequest getRequestItem in request) {
      print('Server___$getRequestItem');

      response.list.add(getRequestItem.name);
    }
    return response;
  }

  @override
  Stream<ListResponse> serverStreamingGetList(
      ServiceCall call, GetRequest request) async* {
    print('------------------------------------');
    print('Server___$request');

    await Future.delayed(Duration(seconds: 1));
    yield ListResponse()..list.addAll(['yield - response 01']);

    await Future.delayed(Duration(seconds: 1));
    yield ListResponse()..list.addAll(['yield - response 02']);

    await Future.delayed(Duration(seconds: 1));
    yield ListResponse()..list.addAll(['yield - response 03']);
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [SampleService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
