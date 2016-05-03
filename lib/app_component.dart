import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:dart_calculator/calculator_component.dart';

@Component(
    selector: 'my-app',
    template: '''
      <h1>{{title}}</h1>
      <nav>
        <a [routerLink]="['Calculator']">Calculator</a>
      </nav>
      <router-outlet></router-outlet>''',
    styleUrls: const ['app_component.css'],
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS])
@RouteConfig(const [
  const Route(
      path: '/calculator',
      name: 'Calculator',
      component: CalculatorComponent,
      useAsDefault: true)
])
class AppComponent {
  String title = 'A calculator in Dart';
}