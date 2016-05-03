import 'package:angular2/core.dart';
import 'dart:html';

const int unknown = -1;
const int OperationTypeAdd = 1;
const int OperationTypeSubtract = 2;
const int OperationTypeMultiply = 3;
const int OperationTypeDivide = 4;

int operationType = unknown;

@Component(
    selector: 'my-calculator',
    templateUrl: 'calculator_component.html',
    styleUrls: const ['calculator_component.css']
)
class CalculatorComponent implements OnInit {
  String screenText = "";
  double number1;

  void numberClicked(event) {
    screenText = "";

    //Add the number clicked to the screen, if the screen number's length is less than 10
    if(screenText.length < 10) {
      screenText = screenText + event.toElement.text;
    }
  }

  void decimalClicked(event) {
    if(!screenText.contains(".")) {
      screenText = screenText + ".";
    }
  }

  void clearScreen(event) {
    //Reset the screen number back to 0
    screenText = "0";
  }

  void clearEverything(event) {
    clearScreen(event);
    operationType = unknown;
    operationTypeChanged(null);
    number1 = null;
  }

  void addClicked(event) {
    operationType = OperationTypeAdd;
    operationTypeChanged(event.toElement);
  }
  void subtractClicked(event) {
    operationType = OperationTypeSubtract;
    operationTypeChanged(event.toElement);
  }
  void multiplyClicked(event) {
    operationType = OperationTypeMultiply;
    operationTypeChanged(event.toElement);
  }
  void divideClicked(event) {
    operationType = OperationTypeDivide;
    operationTypeChanged(event.toElement);
  }
  /**
   * Each operation button calls this method after their click-event is processed
   */
  void operationTypeChanged(selected) {
    //Remove the selected class from each operation button (+ - / *)
    List<Element> operationElements = querySelectorAll(".operation");
    for(Element element in operationElements) {
      element.classes.remove("selected");
    }

    if(operationType != unknown) {
      //Add the selected class to the element that was just clicked
      selected.classes.add("selected");

      //Assign the 'number1' variable, if it isn't already
      if(number1 == null) {
        number1 = double.parse(screenText);
      }
    }
  }

  void equalsClicked(event) {
    if(number1 != null && operationType != unknown) {
      double result;
      double number2 = double.parse(screenText);

      switch(operationType) {
        case OperationTypeAdd:
          result = number1 + number2;
          break;
        case OperationTypeSubtract:
          result = number1 - number2;
          break;
        case OperationTypeMultiply:
          result = number1 * number2;
          break;
        case OperationTypeDivide:
          result = number1 / number2;
          break;
      }

      clearEverything(null);
      String displayString = result.toString();
      if(displayString.length > 10) {
        displayString = displayString.substring(0, 10);
      }
      screenText = displayString;
    }
  }

  ngOnInit() =>
     clearEverything(null);

  CalculatorComponent();
}
