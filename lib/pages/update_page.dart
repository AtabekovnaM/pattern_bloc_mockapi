import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc_mockapi/blocs/update_contact_cubit.dart';
import 'package:pattern_bloc_mockapi/blocs/update_contact_state.dart';
import 'package:pattern_bloc_mockapi/model/contact_model.dart';
import 'package:pattern_bloc_mockapi/views/view_of_update.dart';


class UpdatePage extends StatelessWidget {

  final Contact contact;
  UpdatePage({this.contact});

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fullnameController.text = contact.fullname;
    phoneNumberController.text = contact.mobile;

    return BlocProvider(
      create: (context) => UpdateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Update Contact',),
        ),
        body: BlocBuilder<UpdateContactCubit, UpdateContactState>(
          builder: (context, state) {
            if(state is UpdateContactLoading) {
              return viewOfUpdate(context, true, fullnameController, phoneNumberController, this.contact.id);
            }
            if(state is UpdateContactLoaded) {}
            if(state is UpdateContactError) {}

            return viewOfUpdate(context, false, fullnameController, phoneNumberController, this.contact.id);
          },
        ),
      ),
    );
  }
}