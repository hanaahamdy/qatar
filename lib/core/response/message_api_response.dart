

// part 'api_resoponse.g.dart';
abstract class MessageApiResponse<T> {

  final bool success;
  final String message;
  final T? data;

  MessageApiResponse(
      this.success,
      this.data,
      this.message
      );
}
