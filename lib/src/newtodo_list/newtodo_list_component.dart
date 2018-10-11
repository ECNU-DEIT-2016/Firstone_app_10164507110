import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'newtodo_list_service.dart';

@Component(
  selector: 'newtodo-list',
  styleUrls: ['newtodo_list_component.css'],
  templateUrl: 'newtodo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [const ClassProvider(NewTodoListService)],
)
class NewTodoListComponent implements OnInit {
  final NewTodoListService newtodoListService;

  List<String> items = [];
  String newTodo = '';

  NewTodoListComponent(this.newtodoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await newtodoListService.getTodoList();
  }

  void add() {
    items.add(newTodo);
    newTodo = '';
  }

  String remove(int index) => items.removeAt(index);
}
