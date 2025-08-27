// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:startick/ui/screens/drawer/drawer_list.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';
import 'package:startick/ui/utils/toasts.dart';
import 'package:startick/ui/utils/widgets/common_appbar.dart';
import 'package:startick/ui/utils/widgets/loading.dart';

class ScreenBase<VIEW_MODEL extends ViewModel> extends StatefulWidget {
  final Widget child;
  final bool backClick;
  final VoidCallback? onBack;
  final ValueChanged<String>? onError;

  const ScreenBase({
    super.key,
    required this.child,
    this.onError,
    this.backClick = false,
    this.onBack,
  });

  @override
  State<ScreenBase<VIEW_MODEL>> createState() => _ScreenBaseState<VIEW_MODEL>();
}

class _ScreenBaseState<VIEW_MODEL extends ViewModel>
    extends State<ScreenBase<VIEW_MODEL>> {
  @override
  void initState() {
    withViewModel<VIEW_MODEL>(context, (viewModel) {
      viewModel.onError = (String? errorMessage) {
        if (errorMessage == null) return;
        if (widget.onError == null) {
          errorToast(errorMessage);
        } else {
          widget.onError?.call(errorMessage);
        }
      };
    });
    super.initState();
  }

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (did, result) async {
        if (did) return;
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          if (widget.backClick) {
            DateTime now = DateTime.now();
            if (currentBackPressTime == null ||
                now.difference(currentBackPressTime ?? now) >
                    const Duration(seconds: 2)) {
              currentBackPressTime = now;
              errorToast("Double click to exit app");
            } else {
              exit(0);
            }
          } else if (widget.onBack != null) {
            widget.onBack?.call();
          }
        }
      },
      child: SafeArea(
        child: Stack(
          children: [
            widget.child,
            LoadingIndicatorConsumer<VIEW_MODEL>(),
          ],
        ),
      ),
    );
  }
}

class ScreenBaseScaffold<VIEW_MODEL extends ViewModel> extends StatelessWidget {
  final Widget child;
  final Widget? navigation;
  final VoidCallback? onBack;
  final bool isDrawer, backClick, toProfile;
  final Color? backColor;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ScreenBaseScaffold({
    super.key,
    required this.child,
    this.onBack,
    this.navigation,
    this.backClick = false,
    this.toProfile = false,
    this.backColor,
    this.isDrawer = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenBase<VIEW_MODEL>(
        backClick: backClick,
        onBack: onBack,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            appBar: CommonAppBar(
              onLeadClick: () {
                if (isDrawer) {
                  scaffoldKey.currentState?.openDrawer();
                }
              },
              toProfile: toProfile,
            ),
            bottomNavigationBar: navigation,
            drawer: isDrawer
                ? DrawerList(scaffoldKey: scaffoldKey, toProfile: toProfile)
                : null,
            backgroundColor: backColor ?? Colors.white.withOpacity(0.98),
            body: child,
          ),
        ),
      ),
    );
  }
}

class BaseScaffold<VIEW_MODEL extends ViewModel> extends StatelessWidget {
  final Widget child;
  final Widget? navigation;
  final FloatingActionButton? actionButton;
  final PreferredSizeWidget? appBar;

  const BaseScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.actionButton,
    this.navigation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenBase<VIEW_MODEL>(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            floatingActionButton: SizedBox(
              height: 90,
              width: 90,
              child: actionButton,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: navigation,
            backgroundColor: Colors.white.withOpacity(0.95),
            body: child,
          ),
        ),
      ),
    );
  }
}
