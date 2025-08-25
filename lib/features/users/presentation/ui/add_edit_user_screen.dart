import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/core/data/model/user_model.dart';
import 'package:projectx/features/users/presentation/bloc/user/user_bloc.dart';

class AddEditUserScreen extends StatefulWidget {
  final User? user;
  const AddEditUserScreen({super.key, this.user});

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name = '';
  late String _email = '';
  late String _phone = '';
  late String _bio = '';

  @override
  void initState() {
    _name = widget.user?.name ?? '';
    _email = widget.user?.email ?? '';
    _phone = widget.user?.phone.toString() ?? '';
    _bio = widget.user?.bio ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit User')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                initialValue: _phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              TextFormField(
                initialValue: _bio,
                decoration: const InputDecoration(labelText: 'Bio'),
                maxLines: 2,
                onSaved: (value) {
                  _bio = value ?? '';
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(widget.user == null ? 'Add user' : 'Update user'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Handle the submission logic here, e.g., send data to backend or update state
      final User user = User(
        id: widget.user?.id ?? '',
        name: _name,
        email: _email,
        phone: int.tryParse(_phone) ?? 0,
        bio: _bio,
      );
      if (widget.user == null) {
        context.read<UserBloc>().add(AddUser(user));
      } else {
        context.read<UserBloc>().add(UpdateUser(user));
      }
      Navigator.pop(context);
      print('Name: $_name, Email: $_email, Phone: $_phone, Bio: $_bio');
    }
  }
}
