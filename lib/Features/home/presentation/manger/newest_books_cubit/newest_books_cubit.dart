import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:meta/meta.dart";

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestdBooksUseCase fetchNewBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
