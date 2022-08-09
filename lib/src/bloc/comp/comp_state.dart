part of 'comp_bloc.dart';

enum CompStatus { initial, success, error, loading }

class CompState extends Equatable {
  const CompState({
    this.status = CompStatus.initial,
    this.posts = const <Comp>[],
    // this.hasReachedMax = false,
  });

  final CompStatus status;
  final List<Comp> posts;
  // final bool hasReachedMax;

  CompState copyWith({
    CompStatus? status,
    List<Comp>? posts,
    //   bool? hasReachedMax,
  }) {
    return CompState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      //     hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts];
}

