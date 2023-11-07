import 'package:dartz/dartz.dart';


import '../daos/base_dao.dart';
import '../entities/base_entity.dart';
import '../errors/base_error.dart';
import '../errors/connection_error.dart';
import '../models/base_model.dart';
import '../results/result.dart';

abstract class Repository {

  Result<BaseError, Entity> execute<Model extends BaseModel<Entity>, Entity extends BaseEntity>({
    required Either<BaseError, Model> remoteResult,
  }) {
    if (remoteResult.isRight()) {
      return Result(
        data: (remoteResult as Right<BaseError, Model>).value.toEntity(),
      );
    } else {
      return Result(error: (remoteResult as Left<BaseError, Model>).value);
    }
  }

  Result<BaseError, List<Entity>> executeForList<Model extends BaseModel<Entity>, Entity extends BaseEntity>(
      {required Either<BaseError, List<Model>> remoteResult}) {
    if (remoteResult.isRight()) {
      return Result(
        data: (remoteResult as Right<BaseError, List<Model>>)
            .value
            .map((model) => model.toEntity())
            .toList(),
      );
    } else {
      return Result(
        error: (remoteResult as Left<BaseError, List<Model>>).value,
      );
    }
  }

//   Future<Result<BaseError, List<Entity>>> executeForListWithCacheRemoteFirst<
//   Model extends BaseModel<Entity>,
//   Entity extends BaseEntity,
//   Dao extends BaseDao<Model>>({
//     required Either<BaseError, List<Model>> remoteResult,
//     required Dao dao,
//   }) async {
//     if (remoteResult.isRight()) {
//       final models = (remoteResult as Right<BaseError, List<Model>>).value;
//       await dao.clear();
//       await dao.addAll(models);
//       final entities = models.map((m) => m.toEntity()).toList();
//       return Result(data: entities);
//     } else {
//       final error = (remoteResult as Left<BaseError, List<Model>>).value;
//       if (!(error is ConnectionError)) {
// //        await dao.clear();
//         return Result(error: error);
//       }
//       final models = await dao.getAll();
//       if (models.isNotEmpty) {
//         final entities = models.map((m) => m.toEntity()).toList();
//         return Result(data: entities, error: error);
//       }
//       return Result(error: error);
//     }
//   }
//
//   Future<Result<BaseError, List<Entity>>>
//   executeForListWithCacheRemoteFirstSupportPagination<
//   Model extends BaseModel<Entity>,
//   Entity extends BaseEntity,
//   Dao extends BaseDao<Model>>({
//     required Either<BaseError, List<Model>> remoteResult,
//     required Dao dao,
//     required int page,
//   }) async {
//     if (remoteResult.isRight()) {
//       final models = (remoteResult as Right<BaseError, List<Model>>).value;
//       if (page == 0) {
//         await dao.clear();
//       }
//       await dao.addAll(models);
//       final entities = models.map((m) => m.toEntity()).toList();
//       return Result(data: entities);
//     } else {
//       final error = (remoteResult as Left<BaseError, List<Model>>).value;
//       if (!(error is ConnectionError)) {
// //        await dao.clear();
//         return Result(error: error);
//       }
//       final models = await dao.getAll();
//       if (models.isNotEmpty) {
//         final entities = models.map((m) => m.toEntity()).toList();
//         return Result(data: entities, error: error);
//       }
//       return Result(error: error);
//     }
//   }

  // Future<Result<BaseError, List<Entity>>> executeForListWithCacheLocalFirst<
  //     Model extends BaseModel<Entity>,
  //     Entity extends BaseEntity,
  //     Dao extends BaseDao>({
  //   required
  //       Future<Either<BaseError, List<Model>>> Function() remoteResultExecutor,
  //   required Dao dao,
  // }) async {
  //   final models = await dao.getAll();
  //  // print('DAOs is : ================');
  // //  print(models.toString());
  //   if (models != null && models.length != 0) {
  //     List<Entity> _list = [];
  //     for (int i = 0; i < models.length; i++) {
  //     //  print(i);
  //      // print(models[i].toString());
  //       _list.add(models[i].toEntity());
  //     }
  //     final entities = models.map((m) => m.toEntity()).toList();
  //     print('+++++++Done Cache+++++++++');
  //     return Result(data: _list);
  //   }
  //   final remoteResult = await remoteResultExecutor();
  //   if (remoteResult.isRight()) {
  //     final models = (remoteResult as Right<BaseError, List<Model>>).value;
  //     await dao.clear();
  //     await dao.addAll(models.map((m) => m).toList());
  //     final entities = models.map((m) => m.toEntity()).toList();
  //     print('+++++++Done Remote+++++++++');
  //     return Result(data: entities);
  //   }
  //   final error = (remoteResult as Left<BaseError, List<Model>>).value;
  //   return Result(error: error);
  // }

  Result<BaseError, Object> executeForNoData({
    required Either<BaseError, Object> remoteResult,
  }) {
    if (remoteResult.isRight()) {
      return Result(data: Object());
    }
    return Result(error: (remoteResult as Left<BaseError, Object>).value);
  }
}
