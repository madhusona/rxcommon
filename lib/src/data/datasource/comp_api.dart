import 'package:rxcommon/src/data/models/models.dart';

abstract class CompApi {
  Future<List<Comp>> getItem();
  Future<Map<String, List<Comp>>> getInterest();
  Future<List<QuickView>> getQuickView();
}