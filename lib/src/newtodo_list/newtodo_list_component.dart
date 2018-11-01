import 'dart:async';
import 'dart:math';
import 'dart:html';

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
     MaterialButtonComponent,
    NgFor,
    NgIf,
  ],
  providers: [const ClassProvider(NewTodoListService)],
)
class NewTodoListComponent implements OnInit {
  

  @override
  Future<Null> ngOnInit() async {
   
  }

  void add() {
     var random = Random();
  var number=random.nextInt(12);
  var names=["张静雅","唐莉雯","龙晶毅","吴松二","蔡心蕊","李典康","周嘉翔","戚晓颖","郑可欣","陈瑶","赵世宇","朱子恒"];
querySelector('#text_id')
..text='请'+names[number]+'同学回答问题。';
 
  }

}
