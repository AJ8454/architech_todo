import 'package:architech_todo/src/app/features/authentication/data/models/user_model.dart';
import 'package:architech_todo/src/app/features/authentication/domain/entities/user_entity.dart';
import 'package:architech_todo/src/app/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:architech_todo/src/core/errors/failures.dart';
import 'package:architech_todo/src/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthUsecase authUsecase;

  AuthenticationBloc({required this.authUsecase})
      : super(AuthenticationInitial()) {
    on<SignUpEvent>((event, emit) => _onSignUpEvent(event, emit));
  }

  void _onSignUpEvent(
    SignUpEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthLoadingState());
    final successOrFail = await authUsecase.callCreateUser(event.userEntity);
    emit(successOrFail.fold(
      (l) => AuthFailureState(_mapFailureToMessage(l)),
      (r) => AuthLoadedState(r),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMessage;
      case EmptyCacheFailure:
        return AppStrings.emptyCacheFailureMessage;
      case OfflineFailure:
        return AppStrings.offlineFailureMessage;
      default:
        return "Unexpected Error. Please try again later.";
    }
  }
}
