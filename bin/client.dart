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

/// Dart implementation of the gRPC helloworld.Greeter client.
import 'package:grpc/grpc.dart';
import 'package:helloworld/src/generated/sample.pbgrpc.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );

  final stub2 = SampleClient(channel);

  try {
    print('Client_Call_Unary:\n');

    final unaryResponse =
        await stub2.unaryGetList(GetRequest()..name = 'Unary');
    print('${unaryResponse}');

    await Future.delayed(Duration(seconds: 3));
    print('------------------------------------');
    print('Client_Call_Server_Streaming');

    final ResponseStream responseStream = await stub2
        .serverStreamingGetList(GetRequest()..name = 'Server Streaming');
    await for (ListResponse responseValue in responseStream) {
      print(responseValue);
    }

    await Future.delayed(Duration(seconds: 3));
    print('------------------------------------');
    print('Client_Call_Client_Streaming\n');

    final clientStreamingRespinse =
        await stub2.clientStreamingGetList(stream());
    print(clientStreamingRespinse);

    await Future.delayed(Duration(seconds: 3));
    print('------------------------------------');
    print('Client_Call_BI_Directional_Streaming\n');

    final ResponseStream responseStream2 =
        await stub2.bIDirectionalStreamingGetList(bidStream());

    await for (ListResponse res in responseStream2) {
      print(res);
    }
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}

Stream<GetRequest> stream() async* {
  await Future.delayed(Duration(seconds: 1));
  yield GetRequest()..name = 'Client Streaming 0';
  await Future.delayed(Duration(seconds: 1));
  yield GetRequest()..name = 'Client Streaming 1';
  await Future.delayed(Duration(seconds: 1));
  yield GetRequest()..name = 'Client Streaming 2';
  await Future.delayed(Duration(seconds: 1));
  yield GetRequest()..name = 'Client Streaming 3';
}

Stream<GetRequest> bidStream() async* {
  await Future.delayed(Duration(seconds: 1));
  yield GetRequest()..name = 'Hello 1';
  await Future.delayed(Duration(seconds: 1));
  yield GetRequest()..name = 'Hello 2';
  await Future.delayed(Duration(seconds: 1));
  yield GetRequest()..name = 'Hello 3';
}
