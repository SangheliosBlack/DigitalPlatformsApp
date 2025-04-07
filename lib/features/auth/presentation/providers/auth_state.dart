import 'package:flutter/material.dart';
import 'package:flutter_template/core/services/auth_service/authentication_service_state.dart';
import 'package:flutter_template/features/auth/domain/entities/entities.dart';

class AuthState {

  final bool isLoading;
  final UserEntity? user;
  final String email;
  final String password;
  final String errorMessage;
  final AuthenticationStatus authenticationStatus;
  final List<CommercialFigureEntity> commercialFigures;
  
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  String get commercialFigureSelected {
    
    if(commercialFigures.isEmpty) return "";

    final someSelected = commercialFigures.indexWhere((cf) => cf.active );

    if(someSelected == -1) return commercialFigures.first.name;

    return commercialFigures[someSelected].name;

  }

  String get commercialFigureIdSelected {
    
    if(commercialFigures.isEmpty) return "";

    final someSelected = commercialFigures.indexWhere((cf) => cf.active );

    if(someSelected == -1) return commercialFigures.first.id;

    return commercialFigures[someSelected].id;

  }


  AuthState({
    this.isLoading = false,
    this.user,
    this.email = "",
    this.password = "",
    this.errorMessage = "",
    this.emailController,
    this.passwordController,
    this.authenticationStatus = AuthenticationStatus.checking,
    this.commercialFigures = const []
  });

  AuthState copyWith({
    bool? isLoading,
    UserEntity? user,
    String? email,
    String? password,
    String? errorMessage,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    AuthenticationStatus? authenticationStatus,
    List<CommercialFigureEntity>? commercialFigures
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage : errorMessage ?? this.errorMessage,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      authenticationStatus: authenticationStatus ?? this.authenticationStatus,
      commercialFigures: commercialFigures ?? this.commercialFigures
    );
  }

}