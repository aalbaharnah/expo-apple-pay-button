import { StyleSheet, Text, View, Alert, TouchableOpacity } from 'react-native';

import * as ExpoApplePayButton from 'expo-apple-pay-button';
import { useEffect, useState } from 'react';

export default function App() {

  const [canMakePayments, setCanMakePayments] = useState(true);

  useEffect(() => {
    (async () => {
      try {
        const canMakePayments = await ExpoApplePayButton.canMakePaymentsAsync();
        setCanMakePayments(canMakePayments);
      } catch (error) {
        console.log(error);
        //@ts-ignore
        Alert.alert('Error', error.message);
      }
    })()
  })

  const onPress = async () => {
    try {
      const items: ExpoApplePayButton.PaymentSummaryItem[] = [
        {
          label: 'Item 1',
          amount: "10.00",
        },
        {
          label: 'Item 2',
          amount: "20.00",
        }
      ]

      const payment = await ExpoApplePayButton.startPaymentAsync({
        merchantName: "My Store", // this is the name that will appear on the payment sheet
        merchantId: "merchant.com.merchantId", // this is the merchant id you have to create on the apple developer portal
        items,
      });
      console.log(payment);
      if (!payment) {
        Alert.alert('Payment Failed');
      }
    } catch (error) {
      console.log(error);
      //@ts-ignore
      Alert.alert('Payment Failed', error.message);
    }
  }


  return (
    <View style={styles.container}>
      <Text>{`can make payment?`} {canMakePayments ? 'yes' : 'no'}</Text>
      <TouchableOpacity onPress={onPress}>
        <ExpoApplePayButton.ApplePayButton style={styles.btn} />
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  btn: {
    margin: 12,
    height: 45,
    width: 500,
    borderRadius: 12
  }
});
