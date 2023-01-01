import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:very_good_rx_blog_app/app/app.dart';
import 'package:very_good_rx_blog_app/presentation/home/home.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late ValueNotifier<int> _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    final isKeyBoardShowing = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
          body: ValueListenableBuilder<int>(
            valueListenable: _currentIndex,
            builder: (context, value, child) {
              return LazyLoadIndexedStack(
                index: value,
                children: const [
                  HomeView(),
                  NotificationView(),
                  BookmarkView(),
                  ProfileView(),
                ],
              );
            },
          ),
          floatingActionButton: Visibility(
            visible: !isKeyBoardShowing,
            child: SizedBox.square(
              dimension: 65,
              child: Builder(
                builder: (context) {
                  return FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: AppPalette.primaryColor,
                    shape: const CircleBorder(),
                    child: Assets.icons.plus.svg(
                      color: AppPalette.whiteBackgroundColor,
                      height: 24,
                    ),
                  );
                },
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: AppPalette.whiteBackgroundColor,
            clipBehavior: Clip.hardEdge,
            shape: const CircularNotchedRectangle(),
            child: SizedBox(
              height: 70,
              child: Row(
                children: [
                  _buildBottomBarItem(index: 0, icon: Assets.icons.home),
                  _buildBottomBarItem(index: 1, icon: Assets.icons.bell),
                  const Spacer(),
                  _buildBottomBarItem(index: 2, icon: Assets.icons.bookmark),
                  _buildBottomBarItem(index: 3, icon: Assets.icons.user),
                ],
              ),
            ),
          ),
        );
  }

  Expanded _buildBottomBarItem({
    required int index,
    required SvgGenImage icon,
  }) {
    return Expanded(
      flex: 2,
      child: IconButton(
        icon: ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (context, value, child) {
            return icon.svg(
              color: value == index
                  ? AppPalette.primaryColor
                  : AppPalette.unSelectedColor,
              height: value == index ? 28 : 26,
            );
          },
        ),
        onPressed: () => _currentIndex.value = index,
      ),
    );
  }
}
