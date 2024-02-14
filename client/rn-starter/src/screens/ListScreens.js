import React from "react";
import { Text, StyleSheet, View, FlatList } from "react-native";


const ListScreens = () => {
    const chefs = [
        { name: "chef1",
          signatureMeal: "signaturemeal" 
        },
        { name: "chef2",
          signatureMeal: "signaturemeal" 
        },
        { name: "chef3",
          signatureMeal: "signaturemeal" 
        },
        { name: "chef4",
          signatureMeal: "signaturemeal" 
        },
        { name: "chef5",
          signatureMeal: "signaturemeal" 
        },
        { name: "chef5",
          signatureMeal: "signaturemeal" 
        }
    ]
    return ( <view>
        <FlatList 
            data={chefs}
            //renderItem={(element = { item = {name, signatureMeal} }) =>{}}
            renderItem={({ item }) =>{
                <Text>item.name</Text>,
                <Text>item.signatureMeal</Text>
            }}
        />
        <Text></Text>
    </view>)
}

const styles = StyleSheet.create({
    textStyle : {
        fontSize: 70
    }
})

export default ListScreens;