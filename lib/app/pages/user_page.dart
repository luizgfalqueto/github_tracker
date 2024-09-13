import 'package:flutter/material.dart';
import 'package:github_tracker/app/pages/home_page.dart';
import 'package:github_tracker/app/pages/repos_page.dart';
import 'package:github_tracker/app/repositories/user/user_repository_impl.dart';
import 'package:github_tracker/app/utils/theme_app.dart';

import '../models/user.dart';
import '../widgets/profile_item_description.dart';

class UserPage extends StatefulWidget {
  final User user;

  const UserPage({
    super.key,
    required this.user,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isLoading = false;

  void setLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: ThemeApp.secondaryColor,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.user.avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black87,
                      Colors.black38,
                      Colors.black12,
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
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
                        visible: widget.user.name != '',
                        replacement: const SizedBox.shrink(),
                        child: Text(
                          widget.user.name,
                          style: ThemeApp.titleRegularStyle.copyWith(
                            color: ThemeApp.secondaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '@${widget.user.login}',
                        style: ThemeApp.titleRegularStyle.copyWith(
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
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Visibility(
                    visible: widget.user.bio != '',
                    replacement: const SizedBox.shrink(),
                    child: Text(
                      widget.user.bio,
                      textAlign: TextAlign.center,
                      style: ThemeApp.titleRegularStyle.copyWith(
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
                        '${widget.user.following} following',
                        style: ThemeApp.titleRegularStyle.copyWith(
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
                        '${widget.user.followers} followers',
                        style: ThemeApp.titleRegularStyle.copyWith(
                          color: ThemeApp.secondaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: widget.user.location != '',
                    replacement: const SizedBox.shrink(),
                    child: ProfileItemDescription(
                      icon: Icons.location_on_rounded,
                      text: widget.user.location,
                    ),
                  ),
                  Visibility(
                    visible: widget.user.email != '',
                    replacement: const SizedBox.shrink(),
                    child: ProfileItemDescription(
                      icon: Icons.email,
                      text: widget.user.email,
                    ),
                  ),
                  Visibility(
                    visible: widget.user.company != '',
                    replacement: const SizedBox.shrink(),
                    child: ProfileItemDescription(
                      icon: Icons.business_outlined,
                      text: widget.user.company,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: widget.user.publicRepos != 0,
                    replacement: const SizedBox.shrink(),
                    child: SizedBox(
                      height: 48,
                      width: 240,
                      child: ElevatedButton(
                        onPressed: () async {
                          setLoading();
                          final repos = await UserRepositoryImpl()
                              .getRepos(widget.user.login);
                      
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReposPage(
                                reposList: repos,
                                user: widget.user,
                              ),
                            ),
                          );
                          stopLoading();
                        },
                        child: !isLoading
                            ? Text(
                                '${widget.user.publicRepos} repositórios públicos')
                            : const CircularProgressIndicator(
                                color: ThemeApp.primaryColor,
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
