# How to customize the date time y axis in Flutter charts?

The Flutter Cartesian Chart widget provides support for customizing the axis labels in the chart using the callback event on rendering. A callback event is a callback function or method, which you pass as an argument to another function or method and can perform an action when you require it. If you want to display DateTime values in the y-axis of the cartesian chart, then you can use the NumericAxis to achieve it by converting the DateTime values to millisecondsSinceEpoch integer values and map them to the chart’s y-axis. On rendering, you can use the axisLabelFormatter event to customize the axis label values which are in millisecondsSinceEpoch integer values to DateTime values. So that the numeric y-axis values will be displayed with DateTime values.


## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v2.0.0+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘datetime yaxis customization’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview), or
 [Flutter documentation](https://flutter.dev/docs/get-started/install).

