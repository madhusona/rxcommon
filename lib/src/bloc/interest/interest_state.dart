part of 'interest_bloc.dart';



enum InterestStatus { initial, success, error, loading }

class InterestState extends Equatable {
  final InterestStatus status;
  final Map<dynamic,dynamic> interests;
  const InterestState({
    this.status = InterestStatus.initial,
    this.interests = const {},
    // this.hasReachedMax = false,
  });
  
InterestState copyWith({
    InterestStatus? status,
    Map<dynamic,dynamic>? interests,
 
  }) {
    return InterestState(
      status: status ?? this.status,
      interests: interests ?? this.interests,
    
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, interests: ${interests.length} }''';
  }

  @override
  List<Object> get props => [status, interests];
}