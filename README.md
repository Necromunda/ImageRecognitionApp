# Image regocnition app

## About

This project was made by Johannes Rantapää for WHMP course as the final task.

This project uses Microsoft Azure computer vision AI service to analyze images and show the user what the AI detected from the image.

The app has a couple different pages; An "about-page" that has a bit of information about the app and "previous results-page" that shows your previous images and the results.

## How to run locally

1. Clone the repository with `git clone https://github.com/Necromunda/ImageRecognitionApp.git`

2. Make an Azure Computer Vision resource at https://azure.microsoft.com/en-us/free/cognitive-services/

3. Create `.env` file in project root, same level as `pubspec.yaml`

4. Add these to the `.env` file:
```
ENDPOINT=YOUR_ENDPOINT_FROM_YOUR_COMPUTER_VISION_RESOURCE e.g https://<your_resource_name>.cognitiveservices.azure.com/
KEY=YOUR_KEY_FROM_YOUR_COMPUTER_VISION_RESOURCE
```

5. Build the app with `flutter build apk`. The apk goes to \build\app\outputs\flutter-apk\app-release.apk 

6. Connect your phone with usb-cable to your pc and install the app to your phone using adb with `adb -s <device-id> install PATH\TO\app-release.apk` (You have to enable developer settings in your phone, tap the build number 7 times)
