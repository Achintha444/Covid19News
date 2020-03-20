import 'package:covid_19_info/core/Platform/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfoImpl;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = new MockDataConnectionChecker();
    networkInfoImpl = new NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected()', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        //arrange
        final hasConnection = Future.value(true);
        when(mockDataConnectionChecker.hasConnection)
            .thenAnswer((_) => hasConnection);
        //act
        final result = networkInfoImpl.isConnected;
        //assert
        expect(result, hasConnection);
        verify(mockDataConnectionChecker.hasConnection);
      },
    );
 
  });
}
