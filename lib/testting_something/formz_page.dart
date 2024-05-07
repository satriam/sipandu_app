import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class FormzPage extends StatelessWidget {
  FormzPage({super.key});
  final name = NameInput.pure();
  final joe = NameInput.dirty(value: 'joe');
  final stringEmpty = NameInput.dirty(value: '');
  final valueEmpty = NameInput.dirty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formz page"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "name.value: ${name.value}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "name.isValid: ${name.isValid}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "name.error: ${name.error}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "name.displayError: ${name.displayError}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "name.isNotValid: ${name.isNotValid}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "name.isPure: ${name.isPure}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.red,
                thickness: 10,
              ),
              SizedBox(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "joe.value: ${joe.value}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "joe.isValid: ${joe.isValid}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "joe.error: ${joe.error}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "joe.displayError: ${joe.displayError}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "joe.isNotValid: ${joe.isNotValid}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "joe.isPure: ${joe.isPure}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Divider(
                color: Colors.green,
                thickness: 10,
              ),
              const SizedBox(
                height: 24.0,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "stringEmpty.value: ${stringEmpty.value}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "stringEmpty.isValid: ${stringEmpty.isValid}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "stringEmpty.error: ${stringEmpty.error}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "stringEmpty.displayError: ${stringEmpty.displayError}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "stringEmpty.isNotValid: ${stringEmpty.isNotValid}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "stringEmpty.isPure: ${stringEmpty.isPure}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Divider(
                color: Colors.black,
                thickness: 10,
              ),
              const SizedBox(
                height: 24.0,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "valueEmpty.value: ${valueEmpty.value}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "valueEmpty.isValid: ${valueEmpty.isValid}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "valueEmpty.error: ${valueEmpty.error}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "valueEmpty.displayError: ${valueEmpty.displayError}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "valueEmpty.isNotValid: ${valueEmpty.isNotValid}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "valueEmpty.isPure: ${valueEmpty.isPure}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum NameInputError { empty }

// Extend FormzInput and provide the input type and error type.
class NameInput extends FormzInput<String, NameInputError> {
  // Call super.pure to represent an unmodified form input.
  const NameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const NameInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  NameInputError? validator(String value) {
    return value.isEmpty ? NameInputError.empty : null;
  }
}

const name = NameInput.pure();
// print(name.value); // ''
// print(name.isValid); // false
// print(name.error); // NameInputError.empty
// print(name.displayError); // null

const joe = NameInput.dirty(value: 'joe');
// print(joe.value); // 'joe'
// print(joe.isValid); // true
// print(joe.error); // null
// print(name.displayError);
