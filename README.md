# SEON ID Verification SDK - iOS

## Setting up Developer Environments

The iOS SDK is available to be integrated using Cocoapods. It’s backward compatible down to iOS 13.0. To install it, simply add the following line to your `Podfile`:

```ruby
pod 'SEONIdVerification', '~> 1.5.0'
```

Then run the command below:

```ruby
pod install
```

### Using SDK in Your App

1. Import Framework

```swift
import SEONIdVerification
```

2. Initialize the SDK

Create customer data where the license key field is mandatory, and there are more optional fields you can set in customerData: referenceId, type, email, phoneNumber, name, userId, address.

```swift
let customerData = SEONCustomerData(licenseKey: "YOUR_LICENSE_KEY")
```

Initialize the SDK with the base URL, customerData, and preferred language ISO code. The language code is optional. If it is not set, the SDK will use the language of the OS. You may also want to define a template in the Admin Panel, defining the required steps of the verification based on various requirements for different users. In this case, you can provide the ID of that template to configure the current session to have the relevant steps, as defined in your template. You can also avoid passing this parameter and use the default verification steps.

```swift
SEONIdVerificationService.shared.initialize(
    baseUrl: "https://idv-eu.seon.io", // alternatively: "https://idv-us.seon.io"
    customerData: customerData,
    languageISOCode: "en",
    templateId: "YOUR_TEMPLATE_ID", // Optional. If you have created a template in the admin panel for the verification flow, you can provide its ID here to be used.
)
```

3. Start Verification Flow

To start the verification, you need to pass your UINavigationController:

```swift
SEONIdVerificationService.shared.startIdVerificationFlow(navigationController: navigationController)
```

4. Handle Verification Result

Handle the result with a delegate:

```swift
SEONIdVerificationService.shared.delegate = self

extension YoursDelegateClass: SEONIdVerificationServiceDelegate {
    func didFinishVerificationFlow(result: SEONIdVerification.SEONIdVerificationFlowResult) {
        switch result {
        case .completed:
            // Handle completed result (user finished the verification flow)
        case .completedSuccess:
            // Handle completedSuccess result (user finished the verification flow with successful verification)
        case .completedFailed:
            // Handle completedFailed result (user finished the verification flow with rejected verification)
        case .completedPending:
            // Handle completedPending result (user finished the verification flow with pending verification)
        case .interruptedByUser:
            // Handle interruptedByUser result (user navigated back to the host app)
        case .error(let error):
            // Handle error result (an error code string is passed)
        }
    }
}
```

Handle the result with a completion block:

```swift
SEONIdVerificationService.shared.startIdVerificationFlow(navigationController: navController) { (result: SEONIdVerificationFlowResult) in
    switch result {
        case .completed:
            // Handle completed result (user finished the verification flow)
        case .completedSuccess:
            // Handle completedSuccess result (user finished the verification flow with successful verification)
        case .completedFailed:
            // Handle completedFailed result (user finished the verification flow with rejected verification)
        case .completedPending:
            // Handle completedPending result (user finished the verification flow with pending verification)
        case .interruptedByUser:
            // Handle interruptedByUser result (user navigated back to the host app)
        case .error(let error):
            // Handle error result (an error code string is passed)
        }
    }
}
```

Customize Theme

You can customize the basic colors of the SDK by setting SEONTheme colors:

```swift
SEONTheme.setAccentColor(.purple) // Main fill color for components
SEONTheme.setOnAccentColor(.white) // Text or figure colors on accent background
SEONTheme.setTextOnLightColor(.blue) // Text color on light background
SEONTheme.setTextOnDarkColor(.lightGray) // Text color on dark background
```


For further details, please visit the [Example Application](Example/SEONIDV/Readme.md) in the Repository.

# Changelog

## 1.5.0
-   Name, ZipCode, DateOfBirth Validation
-   Minor improvements

## 1.4.1
-   Made referenceId required in the CustomerData

## 1.3.5
-   Liveness Verification as a Standalone Project
-   Minor improvements

## 1.2.4
-   Minor improvements

## 1.2.2
-   Minor improvements
