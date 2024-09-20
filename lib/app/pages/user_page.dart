import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_tracker/app/pages/repos_page.dart';
import 'package:github_tracker/app/pages/user_bloc/user_bloc.dart';
import 'package:github_tracker/app/utils/theme_app.dart';
import 'package:github_tracker/app/widgets/empty_user_page.dart';

import '../models/user.dart';
import '../utils/page_state_enum.dart';
import '../widgets/profile_item_description.dart';

class UserPage extends StatefulWidget {
  static const String routeName = '/user';

  final String user;

  const UserPage({
    super.key,
    required this.user,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => UserBloc(
          UserInitialState(),
        )..add(
            UserFindEvent(userToSearch: widget.user),
          ),
        child: BlocSelector<UserBloc, UserState, PageStateEnum>(
          selector: (state) {
            if (state is UserStateData) {
              if (state.user != null) {
                return PageStateEnum.loaded;
              }
              return PageStateEnum.empty;
            }
            return PageStateEnum.isLoading;
          },
          builder: (context, pageState) {
            if (pageState == PageStateEnum.empty) {
              return const EmptyUserPage();
            } else if (pageState == PageStateEnum.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Scaffold(
                backgroundColor: ThemeApp.primaryColor,
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      backgroundColor: ThemeApp.primaryColor,
                      expandedHeight: 300.0,
                      stretchTriggerOffset: 100.0,
                      elevation: 0,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/home');
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: ThemeApp.secondaryColor,
                        ),
                      ),
                      flexibleSpace: BlocSelector<UserBloc, UserState, User?>(
                        selector: (state) {
                          if (state is UserStateData) {
                            return state.user;
                          }
                          return null;
                        },
                        builder: (context, user) {
                          if (user != null) {
                            return FlexibleSpaceBar(
                              background: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(user.avatarUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.black87,
                                          Colors.black38,
                                          Colors.black12,
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter),
                                  ),
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Visibility(
                                        visible: user.name != '',
                                        replacement: const SizedBox.shrink(),
                                        child: Text(
                                          user.name,
                                          style: ThemeApp.titleRegularStyle
                                              .copyWith(
                                            color: ThemeApp.secondaryColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        '@${user.login}',
                                        style:
                                            ThemeApp.titleRegularStyle.copyWith(
                                          color: ThemeApp.secondaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              centerTitle: true,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    BlocSelector<UserBloc, UserState, User?>(
                      selector: (state) {
                        if (state is UserStateData) {
                          return state.user;
                        }
                        return null;
                      },
                      builder: (context, user) {
                        if (user != null) {
                          return SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 30,
                              ),
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: user.bio != '',
                                    replacement: const SizedBox.shrink(),
                                    child: Text(
                                      user.bio,
                                      textAlign: TextAlign.center,
                                      style:
                                          ThemeApp.titleRegularStyle.copyWith(
                                        color: ThemeApp.secondaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.people_alt_rounded,
                                        size: 20,
                                        color: ThemeApp.secondaryColor,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        '${user.following} following',
                                        style:
                                            ThemeApp.titleRegularStyle.copyWith(
                                          color: ThemeApp.secondaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Icon(
                                        Icons.circle,
                                        size: 4,
                                        color: ThemeApp.secondaryColor,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        '${user.followers} followers',
                                        style:
                                            ThemeApp.titleRegularStyle.copyWith(
                                          color: ThemeApp.secondaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: user.location != '',
                                    replacement: const SizedBox.shrink(),
                                    child: ProfileItemDescription(
                                      icon: Icons.location_on_rounded,
                                      text: user.location,
                                    ),
                                  ),
                                  Visibility(
                                    visible: user.email != '',
                                    replacement: const SizedBox.shrink(),
                                    child: ProfileItemDescription(
                                      icon: Icons.email,
                                      text: user.email,
                                    ),
                                  ),
                                  Visibility(
                                    visible: user.company != '',
                                    replacement: const SizedBox.shrink(),
                                    child: ProfileItemDescription(
                                      icon: Icons.business_outlined,
                                      text: user.company,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Visibility(
                                    visible: user.publicRepos > 0,
                                    replacement: const SizedBox.shrink(),
                                    child: SizedBox(
                                      height: 48,
                                      width: 240,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          Navigator.pushNamed(
                                            context,
                                            ReposPage.routeName,
                                            arguments:
                                                user.login,
                                          );
                                        },
                                        child: Text(
                                            '${user.publicRepos} repositórios públicos'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    )
                  ],
                ),
              );
            }
          },
        ),
      );
}
