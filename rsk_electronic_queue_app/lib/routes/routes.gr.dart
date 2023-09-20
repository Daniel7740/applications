// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ServiceItemsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServiceItemsPage(),
      );
    },
    QueueTimeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QueueTimePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    UnauthorizedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UnauthorizedPage(),
      );
    },
    ServiceTypeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServiceTypePage(),
      );
    },
    SMSCodeRoute.name: (routeData) {
      final args = routeData.argsAs<SMSCodeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SMSCodePage(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    TicketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TicketPage(),
      );
    },
    FiliationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FiliationPage(),
      );
    },
    QRcodViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QRcodViewPage(),
      );
    },
    YourTicketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const YourTicketPage(),
      );
    },
  };
}

/// generated route for
/// [ServiceItemsPage]
class ServiceItemsRoute extends PageRouteInfo<void> {
  const ServiceItemsRoute({List<PageRouteInfo>? children})
      : super(
          ServiceItemsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceItemsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QueueTimePage]
class QueueTimeRoute extends PageRouteInfo<void> {
  const QueueTimeRoute({List<PageRouteInfo>? children})
      : super(
          QueueTimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'QueueTimeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UnauthorizedPage]
class UnauthorizedRoute extends PageRouteInfo<void> {
  const UnauthorizedRoute({List<PageRouteInfo>? children})
      : super(
          UnauthorizedRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnauthorizedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServiceTypePage]
class ServiceTypeRoute extends PageRouteInfo<void> {
  const ServiceTypeRoute({List<PageRouteInfo>? children})
      : super(
          ServiceTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceTypeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SMSCodePage]
class SMSCodeRoute extends PageRouteInfo<SMSCodeRouteArgs> {
  SMSCodeRoute({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          SMSCodeRoute.name,
          args: SMSCodeRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'SMSCodeRoute';

  static const PageInfo<SMSCodeRouteArgs> page =
      PageInfo<SMSCodeRouteArgs>(name);
}

class SMSCodeRouteArgs {
  const SMSCodeRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'SMSCodeRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [TicketPage]
class TicketRoute extends PageRouteInfo<void> {
  const TicketRoute({List<PageRouteInfo>? children})
      : super(
          TicketRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FiliationPage]
class FiliationRoute extends PageRouteInfo<void> {
  const FiliationRoute({List<PageRouteInfo>? children})
      : super(
          FiliationRoute.name,
          initialChildren: children,
        );

  static const String name = 'FiliationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QRcodViewPage]
class QRcodViewRoute extends PageRouteInfo<void> {
  const QRcodViewRoute({List<PageRouteInfo>? children})
      : super(
          QRcodViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'QRcodViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [YourTicketPage]
class YourTicketRoute extends PageRouteInfo<void> {
  const YourTicketRoute({List<PageRouteInfo>? children})
      : super(
          YourTicketRoute.name,
          initialChildren: children,
        );

  static const String name = 'YourTicketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
