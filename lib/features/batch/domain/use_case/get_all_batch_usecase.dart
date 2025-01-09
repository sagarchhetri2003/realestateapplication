// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';

// import '../../../../app/usecase/usecase.dart';
// import '../../../../core/error/failure.dart';
// import '../entity/batch_entity.dart';
// import '../repository/batch_repository.dart';

// class GetAllBatchUseCase implements UsecaseWithoutParams<List<BatchEntity>>{
//   final IBatchRepository batchRepository;

//   GetAllBatchUseCase({required this.batchRepository});

//   @override
//   Future<Either<Failure, List<BatchEntity>>> call() {
//     return batchRepository.getAllBatches();
//   }

// }

import 'package:dartz/dartz.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/batch_entity.dart';
import '../repository/batch_repository.dart';

class GetAllBatchUseCase implements UsecaseWithoutParams<List<BatchEntity>> {
  final IBatchRepository batchRepository;

  GetAllBatchUseCase({required this.batchRepository});

  @override
  Future<Either<Failure, List<BatchEntity>>> call() async {
    try {
      // Call the repository to fetch all batches
      final result = await batchRepository.getAllBatches();
      return result;
    } catch (e) {
      // If an error occurs, wrap it in a Failure
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

// Define a Failure class for specific errors if not already defined
class ServerFailure extends Failure {
  @override
  final String message;

  ServerFailure({required this.message}) : super(message: '');

  @override
  List<Object> get props => [message];
}
