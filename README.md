# Dexcom Board

This is a submission for **European Healthcare Hackathon (EHH) 2022**.

![Dexcom Board](./showcase.png)

We have chosen **Challenge 5**.

5. Continuous glycemic monitoring in intensive care units
Create an application that allows multiple patients in inpatient wards to be monitored simultaneously
using Dexcom sensors. Utilizing the Dexcom G6 continuous glycemic monitoring system will improve
care for hospitalized patients in ICU beds and integration into a single interface will reduce
staff workload. Teams will be provided with sensors and mobile phones.
___

## Challenge description

### Problems
- Lengthy collection of blood glucose values
- Inconsistent collection system
- Inability to monitor multiple patients at once in real-time
- Lack of notifications about critical glucose levels

### Solution
- A multiplatform (Flutter) application for real-time glucose level monitoring. Supported platforms are: Mobile, Desktop, Tablet & Web.
- Upload patients' snapshots to the FHIR server
- No more additional HW needed
- Transmitter reusability (setup once, use forever)

## How it works
In short, we have rewritten [pydexcom](https://github.com/gagebenne/pydexcom) Python library into Dart so we could create and use it in a Flutter application.
This library allows us interact with Dexcom Share service. The difference from the official Dexcom API is that this library uses a private hidden one,
with which we can fetch real-time glucose levels.

The application is also able to upload patients' snapshots to the FHIR server.


## How to run
You can download executables (Windows and/or Android) from the [releases](https://github.com/mzdm/dexcom_board/releases/tag/dev-0.0.11) or 
run the web version from [here](https://dexcom-board.web.app/#/).

**Note**: Make sure to have at least one follower to enable the share service.

**Information for testers**: If you don't have a Dexcom account and connected it to G6 sensor, approach @Matej Zidek, @Tomas Dorda or @Daniel Sulc
on the EHH2022 Slack channel. We can send you the credentials.

It should also support macOS, iOS and Linux, but we have not tested it on these platforms.

You can also build and run the application from the source code.
- or run on any platform using:

`flutter run --dart-define FHIR_API_KEY=YOUR_FHIR_API_KEY`

- build Web version using: 

`flutter build web --release --dart-define FHIR_API_KEY=YOUR_FHIR_API_KEY --web-renderer html`
