// part 'api_resoponse.g.dart';
abstract class ApiResponse<T> {

  final bool success;
  final T? data;

  ApiResponse(
    this.success,
    this.data,
  );
}
