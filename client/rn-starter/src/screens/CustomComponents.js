import React from "react";
import { Text, StyleSheet } from "react-native";


const CustomComponents = () => {
    return <Text style={styles.textStyle}>this is my custom component lmao</Text>
}

const styles = StyleSheet.create({
    textStyle : {
        fontSize: 70
    }
})

export default CustomComponents;