//!logged out routes
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lnq/core/routing/app_routes.dart';
import 'package:lnq/features/auth/views/login_view.dart';
import 'package:lnq/features/base_nav/wrapper/base_nav_wrapper.dart';
import 'package:lnq/features/profile/views/complete_profile_view.dart';
import 'package:routemaster/routemaster.dart';

RouteMap loggedOutRoute = RouteMap(routes: {
  AppRoutes.base: (_) => const MaterialPage(child: LoginView()),
});

//!logged in routes
RouteMap loggedInRoute = RouteMap(
  routes: {
    AppRoutes.base: (_) => MaterialPage(
          child: Consumer(
            builder: (context, ref, child) {
              // UserModel user = ref.watch(userProvider)!;

              // if (user.nickName!.isEmpty) {
              //   return const NickNameInputView();
              // } else if (user.isUserTypePicked == false) {
              //   return const ChooseUserType();
              // } else if (user.organisationsCreated!.isEmpty &&
              //     user.isTeamLead == true) {
              //   return const CreateOrganisationView();
              // } else {
              //   return const BaseNavWrapper();
              // }

              return const BaseNavWrapper();
            },
          ),
        ),
    // AppRoutes.createOrg: (_) => const MaterialPage(
    //       child: CreateOrganisationView(),
    //     ),
    // AppRoutes.baseNav: (_) => const MaterialPage(
    //       child: BaseNavWrapper(),
    //     ),
    // AppRoutes.project: (routeData) => MaterialPage(
    //       child: ProjectVersionsView(
    //         projectName: routeData.pathParameters['projectname']!,
    //       ),
    //     ),
    // AppRoutes.version: (routeData) => MaterialPage(
    //       child: VersionBugsView(
    //         versionName: routeData.pathParameters['versionname']!,
    //         projectName: routeData.pathParameters['projectname']!,
    //       ),
    //     ),
    // AppRoutes.openBugs: (_) => const MaterialPage(
    //       child: OpenBugsView(),
    //     ),
    // '/profile/:userId': (routeData) => MaterialPage(
    //       child: OtherUserProfileView(
    //         userId: routeData.pathParameters['userId']!,
    //       ),
    //     ),
    // '/post/:postId': (routeData) => MaterialPage(
    //       child: PostView(
    //         postId: routeData.pathParameters['postId']!,
    //       ),
    //     ),
    // '/approval-status': (_) => const MaterialPage(
    //       child: AppprovalStatusView(),
    //     ),
    // '/add-post/:from': (routeData) => MaterialPage(
    //       child: AddPostView(
    //         isFromCommunity: routeData.pathParameters['from']!,
    //       ),
    //     ),
    // '/bookmarks': (routeData) => const MaterialPage(
    //       child: BookmarksView(),
    //     ),
    // // '/create-community': (_) => const MaterialPage(
    // //       child: CreateCommunityScreen(),
    // //     ),
    // '/com/:name': (route) => MaterialPage(
    //       child: CommnunityProfileView(
    //         name: route.pathParameters['name']!,
    //       ),
    //     ),
    // '/com/:name/community-settings/:name': (routeDate) => MaterialPage(
    //       child: CommunitySettingsView(
    //         name: routeDate.pathParameters['name']!,
    //       ),
    //     ),
    // '/com/:name/community-settings/:name/edit-community/:name': (routeData) =>
    //     MaterialPage(
    //       child: EditCommunityView(
    //         name: routeData.pathParameters['name']!,
    //       ),
    //     ),
    // '/com/:name/community-settings/:name/add-mods/:name': (routeData) =>
    //     MaterialPage(
    //       child: AddModsView(
    //         name: routeData.pathParameters['name']!,
    //       ),
    //     ),
    // '/image/:url': (routeData) => MaterialPage(
    //       child: ImageView(
    //         imageUrl: routeData.pathParameters['url']!,
    //       ),
    //     ),
    // '/edit-profile': (routeData) => const MaterialPage(
    //       child: EditProfileView(),
    //     ),
  },
);
