import 'package:dartz/dartz.dart';
import 'package:next_starter/data/models/base_model.dart';
import 'package:next_starter/data/models/pagination_model.dart';

import '../errors/app_error.dart';

typedef EitherResponse<T> = Future<Either<AppError, T>>;
typedef PaginatedResponse<T extends BaseModel> = Future<Either<AppError, PaginationModel<T>>>;
