import 'package:architech_todo/src/app/features/global/custom_rounded_button.dart';
import 'package:architech_todo/src/app/features/global/snackbar_message.dart';
import 'package:architech_todo/src/app/features/global/top_container.dart';
import 'package:architech_todo/src/app/features/home/presentation/bloc/home_bloc.dart';
import 'package:architech_todo/src/app/features/splash/presentation/pages/splash_page.dart';
import 'package:architech_todo/src/app/features/theme/presentation/widgets/theme_button_widget.dart';
import 'package:architech_todo/src/core/responsive/app_responsive.dart';
import 'package:architech_todo/src/core/routes/app_navigator.dart';
import 'package:architech_todo/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(GetLoggedUserDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeLoadedState) {
          return Column(
            children: [
              _homeHeader(context, state),
              _hometaskBody(context),
            ],
          );
        }
        return const SizedBox();
      },
      listener: (context, state) {
        if (state is HomeFailureState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.error, context: context);
        }
        if (state is UserLoggetOutState) {
          AppNavigator.pushReplace(context, SplashPage.route);
        }
      },
    ));
  }

  _hometaskBody(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppResponsive.kdefaultPadding + 10),
          child: Column(
            children: [
              todoButtons(
                context,
                lable1: "All Tasks",
                onClicked1: () {},
                lable2: "New Task",
                onClicked2: () {},
              ),
              const SizedBox(height: 30),
              todoButtons(
                context,
                lable1: "In Progress",
                onClicked1: () {},
                lable2: "Done",
                onClicked2: () {},
              ),
              const SizedBox(height: 30),
              todoButtons(
                context,
                lable1: "Expired",
                onClicked1: () {},
                lable2: "Up Coming",
                onClicked2: () {},
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Row todoButtons(
    BuildContext context, {
    required String lable1,
    required VoidCallback onClicked1,
    required String lable2,
    required VoidCallback onClicked2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: AppResponsive.height(context) * 0.15,
          width: AppResponsive.width(context) * 0.4,
          child: CustomRoundedButtonWidget(
            onClicked: onClicked1,
            child: Text(
              lable1,
              style: AppResponsive.responsiveTextStyle(
                context,
                tColor: AppColor.white,
                fweight: FontWeight.bold,
                fsize: AppResponsive.klargeFont(context),
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppResponsive.height(context) * 0.15,
          width: AppResponsive.width(context) * 0.4,
          child: CustomRoundedButtonWidget(
            onClicked: onClicked2,
            child: Text(
              lable2,
              style: AppResponsive.responsiveTextStyle(
                context,
                fweight: FontWeight.bold,
                tColor: AppColor.white,
                fsize: AppResponsive.klargeFont(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  TopContainer _homeHeader(BuildContext context, HomeLoadedState state) {
    return TopContainer(
      height: AppResponsive.height(context) * 0.32,
      width: double.infinity,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: AppColor.white,
                  ),
                ),
                const Spacer(),
                const TheemButtonWidget(),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(UserLogoutEvent());
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: AppColor.white,
                  ),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppResponsive.kdefaultPadding),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: AppResponsive.width(context) * 0.12,
                    backgroundColor: AppColor.white,
                    child: const Icon(
                      Icons.person,
                      size: 54,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${state.userModel.fName} ${state.userModel.lName}",
                        style: AppResponsive.responsiveTextStyle(
                          context,
                          fsize: AppResponsive.kmaxExtraLargeFont(context),
                          tColor: AppColor.white,
                          fweight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.userModel.email,
                        style: AppResponsive.responsiveTextStyle(context,
                            tColor: AppColor.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
