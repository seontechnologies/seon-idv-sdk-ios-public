# SEON ID Verification SDK - iOS

## Setting up Developer Environments

The iOS SDK is available to be integrated using Cocoapods and SPM. To install it, simply add the following line to your `Podfile`:

```ruby
pod 'SEONIdVerification', '~> 2.0.1'
```

Then run the command below:

```ruby
pod install
```

Alternatively, since version 1.6.0, you can install the SDK through SPM simply using this URL:

https://github.com/seontechnologies/seon-idv-sdk-ios-public

While we try to keep the backward compatibility down to lower iOS versions (currently down to 13.0), since some Document Verification Providers are releasing their updates on iOS 16 and higher, we are providing both variants for you. If you require to support iOS users down to iOS 13.0, simply use the configurations above. And if you prefer to go on the higher edge and have those updates published on higher iOS versions, use  configurations below. Please note that this doesn't mean that the above configurations will not get updated with latest features anymore, as we will keep updating the SDK with latest changes available from our providers on both variants. So, please stay tuned and make the choice based on the condition of your own app between the two variants.

### In case you want to use iOS 16+ variant:

```ruby
pod 'SEONIdVerification-ModernAPI', '~> 2.0.1'
```

For SPM, you can use tags which has the `-ModernAPI` suffix to get the iOS 16+ variant. As of now, the latest release has the tag:

```
v2.0.1-ModernAPI
```

We will update each of variants as soon as we have more updates and improvements from each group of providers. Of course, internal updates from SEON and the services which are solely provided by SEON will be updated on both variants.


### Using SDK in Your App

#### 1. Import Framework

```swift
import SEONIdVerification
```

#### 2. Initialize the SDK

Create customer data where the license key field is mandatory, and there are more optional fields you can set in customerData: referenceId, type, email, phoneNumber, name, userId, address.

```swift
let customerData = SEONCustomerData(
  licenseKey: "YOUR_LICENSE_KEY",
  referenceId: "UNIQUE_REFERENCE_ID", // Random unique value for the session
                                      // e.g. UUID, or {userID}-{timestamp} (required)
  email: "user@example.com",          // Email input (optional)
  name: "John Doe",                   // Name input (optional)
  phoneNumber: "+1234567890",         // Phone number input (optional)
  type: "id-verification",            // Process type (optional)
  userId: "user123",                  // Unique user identifier (optional)
  countryISOCode: "US",               // ISO code for the country (optional)
  address: "123 Main St, NY",         // Address input (optional)
  dateOfBirth: {                      // Reference date for the DoB check (optional)
    day: 1,
    month: 1,
    year: 2000,
  },
  postalCode: "12345",                // Reference value for postal check (optional)
  additionalProperties: {             // Custom key-value pairs (optional)
    customField1: "value1",
    customField2: "value2",
  },
)
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

#### 3. Start Verification Flow

To start the verification, you need to pass your UINavigationController:

```swift
SEONIdVerificationService.shared.startIdVerificationFlow(navigationController: navigationController)
```

#### 4. Handle Verification Result

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
SEONTheme.setWatermarkImage(customUIImage) // To replace a watermark image with SEON's
SEONTheme.setWatermarkImageVisibility(false) // Hide SEON Watermark Image if Needed
SEONTheme.setCustomFont(customFont) // If you want to use a standard font, no need to pass different variations
SEONTheme.setCustomFont(
    regular: regularFont,
    semibold: semiboldFont,
    bold: boldFont
) // If you want to use a custom font, you need to pass our three variations in use
```

#### 5. Error Codes Documentation

Please refer to [this page](ErrorCodes.md) for the descriptive error codes.

For further details, please visit the [Example Application](Example/SEONIDV/Readme.md) in the Repository.

# Changelog

## 2.0.1
-   Introduced a new variant for iOS 16+ updates which ID verification providers published. Both variants will be updated constantly as long as the lower iOS versions are supported by our customers and also by Apple.
-   Upgraded the Document Verification SDK, which improves UX and verification results
-   White-labeling the SDK. Now you can modify fonts and watermarks on the SDK flow
-   Minor improvements

## 1.6.1
-   Fixed Sign issue on SPM
-   Minor improvements

## 1.6.0
-   Improvements on Liveness Verification Check
-   Better visibility with descriptive error handling in the SDK session
-   Added support for SPM
-   Minor improvements

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

