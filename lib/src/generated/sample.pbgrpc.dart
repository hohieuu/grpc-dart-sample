///
//  Generated code. Do not modify.
//  source: sample.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sample.pb.dart' as $0;
export 'sample.pb.dart';

class SampleClient extends $grpc.Client {
  static final _$unaryGetList =
      $grpc.ClientMethod<$0.GetRequest, $0.ListResponse>(
          '/helloworld.Sample/UnaryGetList',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ListResponse.fromBuffer(value));
  static final _$serverStreamingGetList =
      $grpc.ClientMethod<$0.GetRequest, $0.ListResponse>(
          '/helloworld.Sample/ServerStreamingGetList',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ListResponse.fromBuffer(value));
  static final _$clientStreamingGetList =
      $grpc.ClientMethod<$0.GetRequest, $0.ListResponse>(
          '/helloworld.Sample/ClientStreamingGetList',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ListResponse.fromBuffer(value));
  static final _$bIDirectionalStreamingGetList =
      $grpc.ClientMethod<$0.GetRequest, $0.ListResponse>(
          '/helloworld.Sample/BIDirectionalStreamingGetList',
          ($0.GetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ListResponse.fromBuffer(value));

  SampleClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListResponse> unaryGetList($0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unaryGetList, request, options: options);
  }

  $grpc.ResponseStream<$0.ListResponse> serverStreamingGetList(
      $0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$serverStreamingGetList, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.ListResponse> clientStreamingGetList(
      $async.Stream<$0.GetRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$clientStreamingGetList, request,
            options: options)
        .single;
  }

  $grpc.ResponseStream<$0.ListResponse> bIDirectionalStreamingGetList(
      $async.Stream<$0.GetRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$bIDirectionalStreamingGetList, request,
        options: options);
  }
}

abstract class SampleServiceBase extends $grpc.Service {
  $core.String get $name => 'helloworld.Sample';

  SampleServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.ListResponse>(
        'UnaryGetList',
        unaryGetList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.ListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.ListResponse>(
        'ServerStreamingGetList',
        serverStreamingGetList_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.ListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.ListResponse>(
        'ClientStreamingGetList',
        clientStreamingGetList,
        true,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.ListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.ListResponse>(
        'BIDirectionalStreamingGetList',
        bIDirectionalStreamingGetList,
        true,
        true,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.ListResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListResponse> unaryGetList_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return unaryGetList(call, await request);
  }

  $async.Stream<$0.ListResponse> serverStreamingGetList_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async* {
    yield* serverStreamingGetList(call, await request);
  }

  $async.Future<$0.ListResponse> unaryGetList(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Stream<$0.ListResponse> serverStreamingGetList(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.ListResponse> clientStreamingGetList(
      $grpc.ServiceCall call, $async.Stream<$0.GetRequest> request);
  $async.Stream<$0.ListResponse> bIDirectionalStreamingGetList(
      $grpc.ServiceCall call, $async.Stream<$0.GetRequest> request);
}
