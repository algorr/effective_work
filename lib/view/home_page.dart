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
        var isStarted = BlocProvider.of<CounterCubit>(context).isStarted;
        return Scaffold(
          backgroundColor: context.watch<CounterCubit>().isStarted == false
              ? Theme.of(context).primaryColor
              : HomePageConsts.startPomoColor,
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
                        context.read<CounterCubit>().isStarted == false
                            ? HomePageConsts.readyTitle
                            : HomePageConsts.focusTitle,
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
                  duration: 2,
                  isReverse: true,
                  fillColor: CircularCounterConsts.progressColor,
                  ringColor: CircularCounterConsts.fillColor,
                  autoStart: false,
                  textStyle: isStarted == false
                      ? CircularCounterConsts.stopStyle
                      : CircularCounterConsts.startStyle,
                  controller: context.read<CounterCubit>().controller,
                  onComplete: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.height * .01,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('Congrats!'),
                                    Icon(Icons.check_outlined)
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                    // change state of counterstate
                    BlocProvider.of<CounterCubit>(context).stopEmitter();
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * .02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Button(
                        onPressed: () {
                          if (isStarted) {
                            BlocProvider.of<CounterCubit>(context)
                                .stopCounter();
                          } else {
                            BlocProvider.of<CounterCubit>(context)
                                .startCounter();
                          }
                        },
                        text: isStarted == false
                            ? Buttons.startButtonText
                            : Buttons.stopButtonText,
                      ),
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

// show model bottom sheet
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

// for all homepage and bottom sheet buttons
class _Button extends StatelessWidget {
  const _Button({
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
        primary: context.read<CounterCubit>().isStarted == false
            ? Buttons.passiceButtonColor
            : Buttons.activeButtonColor,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// textfield for bottom sheet
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
