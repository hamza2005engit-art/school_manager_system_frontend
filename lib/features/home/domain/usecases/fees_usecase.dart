
import 'package:student_project1/features/home/domain/entities/fees_user.dart';

import '../repositories/home_repository.dart';

class FeesUsecase {
  final HomeRepository repository;

  FeesUsecase(this.repository);

  Future<FeesUser> call(FeesUser feesuser) {
    return  repository.feesuser(feesuser);
  }
}