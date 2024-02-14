import { createAppContainer } from "react-navigation";
import { createStackNavigator } from "react-navigation-stack";
import HomeScreen from "./src/screens/HomeScreen";
import CustomComponents from "./src/screens/CustomComponents";

const navigator = createStackNavigator(
  {
    Home: HomeScreen,
    Component: CustomComponents,
  },
  {
    initialRouteName: "Component",
    defaultNavigationOptions: {
      title: "App",
    },
  }
);

export default createAppContainer(navigator);
