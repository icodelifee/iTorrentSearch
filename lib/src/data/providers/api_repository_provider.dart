import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/dio_instance.dart';
import '../repository/remote/api_repository.dart';

final apiRepositoryProvider = Provider<APIRepository>((ref) => APIRepository(dioInstance));
