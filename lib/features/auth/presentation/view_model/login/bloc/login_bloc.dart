// // import 'package:equatable/equatable.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';
// // import 'package:realestateapplication/features/home/presentation/view_model/home_cubit.dart';

// // part 'login_event.dart';
// // part 'login_state.dart';

// // class LoginBloc extends Bloc<LoginEvent, LoginState> {
// //   final SignUpBloc _signupBloc;
// //   final HomeCubit _homeCubit;
// //   LoginBloc({
// //     required SignUpBloc registerBloc,
// //     required HomeCubit homeCubit,
// //   })  : _signupBloc = _signupBloc,
// //         _homeCubit = homeCubit,
// //         super(LoginState.initial()) {
// //     on<NavigateRegisterScreenEvent>((event, emit) {
// //       Navigator.push(
// //         event.context,
// //         MaterialPageRoute(
// //           builder: (context) => BlocProvider.value(
// //               value: _signupBloc, child: event.destination),
// //         ),
// //       );
// //     });

// //     on<NavigateHomeScreenEvent>((event, emit) {
// //       Navigator.pushReplacement(
// //         event.context,
// //         MaterialPageRoute(
// //           builder: (context) => BlocProvider.value(
// //             value: _homeCubit,
// //             child: event.destination,
// //           ),
// //         ),
// //       );
// //     });
// //   }
// // }

// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';
// import 'package:realestateapplication/features/home/presentation/view_model/home_cubit.dart';

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final SignupBloc _signupBloc;
//   final HomeCubit _homeCubit;

//   LoginBloc({
//     required SignupBloc registerBloc,
//     required HomeCubit homeCubit,
//   })  : _signupBloc = registerBloc, // Assign registerBloc to _signupBloc
//         _homeCubit = homeCubit,
//         super(LoginState.initial()) {
//     on<NavigateRegisterScreenEvent>((event, emit) {
//       Navigator.push(
//         event.context,
//         MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: _signupBloc,
//             child: event.destination,
//           ),
//         ),
//       );
//     });

//     on<NavigateHomeScreenEvent>((event, emit) {
//       Navigator.pushReplacement(
//         event.context,
//         MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: _homeCubit,
//             child: event.destination,
//           ),
//         ),
//       );
//     });
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required SignupBloc signupBloc}) : super(LoginState.initial()) {
    // Handle navigation to the Login screen
    on<NavigateRegisterScreenEvent>((event, emit) {
      _handleNavigationToRegisterScreen(event);
    });
  }

  void _handleNavigationToRegisterScreen(NavigateRegisterScreenEvent event) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) =>
            event.destination, // Destination widget (e.g., LoginPage)
      ),
    );
  }
}
