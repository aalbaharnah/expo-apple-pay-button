## React Native Expo Apple Pay Button
A React Native library for integrating native Apple Pay button views (PKPaymentButton) into your Expo Flow iOS applications.

### Installation
```bash
npm install expo-apple-pay-button
```..
### XCode Configuration
You'll need to add Apple Pay capability from xcode
![image](https://github.com/aalbaharnah/expo-apple-pay-button/assets/11477123/d20833ef-27a8-4919-b828-574598cb2431)


### Usage
Import the `ApplePayButton` component from the library:
```javascript
import { ApplePayButton } from 'react-native-expo-apple-pay-button';
Place the ApplePayButton component in your render method:
javascript
Copy code
<ApplePayButton
  buttonStyle="black"
  buttonType="plain"
  onPress={() => {
    // Handle Apple Pay button press event
  }}
/>
```

### Props
- **buttonStyle (string):** The style of the Apple Pay button. Possible values are `"white"` or `"black"`.
- **buttonType (string)**: The type of the Apple Pay button. Possible values are `"plain"`, "buy", `"setUp"`, or `"inStore"`.
- **onPress (function):** Callback function called when the Apple Pay button is pressed.

### Example
```javascript
import React from 'react';
import { View } from 'react-native';
import { ApplePayButton } from 'react-native-expo-apple-pay-button';

export default function App() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <ApplePayButton
        buttonStyle="black"
        buttonType="plain"
        onPress={() => {
          // Handle Apple Pay button press event
        }}
      />
    </View>
  );
}
```

### Notes
This library only supports iOS applications.
Make sure your Expo project is properly configured to use Apple Pay.

### License
This library is licensed under the MIT License.
