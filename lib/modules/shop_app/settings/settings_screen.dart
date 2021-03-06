import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/states.dart';
import 'package:flutter_app/shared/adaptive/adaptivw_indicator.dart';
import 'package:flutter_app/shared/components/componets.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;
        return (model != null)
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if (state is ShopLoadingUpdateUserState)
                          LinearProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'name must not be empty';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'email must not be empty';
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'phone must not be empty';
                            }

                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopCubit.get(context).updateUserData(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'update'),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                            function: () {
                              signOut(context);
                            },
                            text: 'Logout'),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: AdaptiveIndicator(
                os: getOS(),
              ));
      },
    );
  }
}
