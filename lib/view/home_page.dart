import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:effective_work/consts/main_consts.dart';
import 'package:effective_work/viewmodel/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Pomo"),
            actions: [
              InkWell(
                onTap: () {
                  //show modal widget opens
                  _showModalWidget(context, nameController, emailController);
                },
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * .01),
                  child: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/ic_profile_photo.jpg'),
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * .02),
                      child: Text(
                        'Ready for Deep Dive?',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                CircularCountDownTimer(
                  width: 200,
                  height: 200,
                  duration: 60,
                  fillColor: Colors.blue,
                  ringColor: Colors.grey,
                  textFormat: 'Start',
                  autoStart: false,
                  controller: context.read<CounterCubit>().controller,
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * .02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).startCounter();
                        },
                        text: 'Start',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      Button(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .stopCounter();
                          },
                          text: 'Break')
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showModalWidget(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/ic_profile_photo.jpg',
                    ),
                  ),
                ),
                _CustomTextField(
                  nameController: nameController,
                  text: 'Name:',
                  prefixIcon: Icons.person_outline,
                ),
                _CustomTextField(
                  nameController: emailController,
                  text: 'Email:',
                  prefixIcon: Icons.email_outlined,
                ),
                TextButton(onPressed: () {}, child: const Text('Save'))
              ],
            ),
          );
        });
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: HomePageConsts.buttonColor,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    Key? key,
    required this.text,
    required this.prefixIcon,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;
  final String text;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * .03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Expanded(
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(prefixIcon),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ],
      ),
    );
  }
}
