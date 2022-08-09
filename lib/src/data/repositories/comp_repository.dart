import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rxcommon/src/data/datasource/comp_api.dart';
import 'package:rxcommon/src/data/models/models.dart';
import 'package:rxcommon/src/exception.dart';
import 'package:rxcommon/src/failure.dart';

class CompRepository{
  final CompApi compApi;
  CompRepository({required this.compApi});
  @override
  Future<Either<Failure,List<Comp>>> getComp() async {
    try{
      final result=await compApi.getItem();
      return Right(result);    
    }on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
   
  }
  
  @override
  Future<Either<Failure,Map<String, List<Comp>>>> getInterest() async{
     try{
      final result=await compApi.getInterest();
      return Right(result);    
    }on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
  
  @override
  Future<Either<Failure, List<QuickView>>> getQuickView() async{
         try{
      final result=await compApi.getQuickView();
      return Right(result);    
    }on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }  
}