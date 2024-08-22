# Flutter Firebase & Telegram Integration Demo

This project demonstrates the integration of Firebase and Telegram in a Flutter application, along with setting up CI/CD using GitHub Actions. The goal is to provide a template for developers who want to implement similar features in their Flutter projects.

## Example App

| <img src="https://github.com/mahdiyarz/persian_flutter_ci_cd/blob/main/doc/images/app_screenshot.jpg?raw=true" width='250' alt="App Screenshot" /> | <img src="https://github.com/mahdiyarz/persian_flutter_ci_cd/blob/main/doc/images/web_app_screenshot.jpg?raw=true" width='250' alt="Web App Screenshot" /> |
| :------: | :------: | 
| App Screenshot | Web App Screenshot |
| **Web App Link** |  [persian-flutter-ci-cd-917ee.web.app](https://persian-flutter-ci-cd-917ee.web.app) |

## Features

- **Firebase Integration**: Firebase Hosting are integrated into this Flutter project.
- **Telegram Integration**: The Github action can send messages using the Telegram API.
- **CI/CD**: Continuous Integration and Continuous Deployment are configured using GitHub Actions.

## Getting Started

### Step 1: Create and Set Up a Flutter Project

- Create a Flutter project and push to your Github account.

### Step 2: Set Up Firebase

- Create a Firebase project in your Firebase Console account.
- Add the hosting section from **Build** panel and click the **Get started** button.
- Install Firebase CLI with this command:  `npm install -g firebase-tools`
- After installing the Firebase CLI finished, run `firebase login`
- Then run `firebase init` in your app root directory.
    - Select `Hosting: Configure files for Firebase Hosting and (optionally) set up Github Action deploys` and press enter.
    - Choose your existing project from your Firebase projects list.
    - For the first question, `What do you want to use as your public directory?`, answer `build/web`.
    - For the second question, Configure as a single-page app?, answer `yes`.
    - For the last question about setting up auto builds and deploys with GitHub, answer `no`.
- As a final step to initialize firebase in your project run `firebase deploy` in your app's root directory.
- The **Hosting URL** will be displayed in the final line. Copy this URL and save it for the next steps.

### Step 3: Set Up GitHub Workflows

- Create a `.github` folder in your app's root directory.
- Inside `.github`, create a `workflows` folder.
- In the `workflows` folder, create a YAML file, e.g, `demo_release.yml`, and write all your workflow code here.

### Step 4: Configure Firebase Secrets in GitHub

- Run `firebase login:ci` in command line to generate your Firebase token.
- Go to your project settings in the project repository, navigate to the `Actions` tab under the `Secrets and variables` section.
- Create a **New repository secret**, name it `FIREBASE_TOKEN`, and paste the token value.
- Open the `<app root>/.firebaserc` file and copy the value of the "default" key. Create another repository secret named `FIREBASE_PROJECT_NAME` and paste the value.
- Create another **New repository secret** for the Hosting URL saved earlier, name it `PROJECT_WEB_URL`, and paste the URL.

### Step 5: Set Up Telegram Bot

- Search `@BotFather` in your Telegram account and run `/start`.
- Run `/newbot`, name your bot, and choose a username.
- If the username is accepted, the bot will provide you with an API token.
- Search for your bot’s username in Telegram and press the **Start** button.
- Create a **New repository secret** in GitHub, name it `TELEGRAM_BOT_TOKEN`, and paste the Telegram API token.

### Step 6: Set Up Telegram Chat ID

- If we want to send the success/failure message of the Github action into a personal chat we need to follow these steps:
    - Search the bot username in your Telegram account and send a message. e.g. "hello word"
    - Open the Postman and send a GET request to `https://api.telegram.org/bot<TELEGRAM_BOT_TOKEN>/getUpdates`.
    - Copy your chat ID from Postman response.
        ```
            "from": {
                "id": <your chat ID>,
                "is_bot": false,
                "first_name": "mahDyar",
                "last_name": "arbabZ",
                "username": "mahDyarZ",
                "language_code": "en"
                },
        ```
- If we want to send the success/failure message of the Github action into a Telegram group we need to follow these steps:
    - Add the bot into the group and send `/start` in group chat.
    - Open the Postman and send a GET request to `https://api.telegram.org/bot<TELEGRAM_BOT_TOKEN>/getUpdates`.
    - Copy your chat ID from Postman response.
        ```
            "chat": {
                "id": -<your group ID>,
                "title": "CI/CD Integration Test Group",
                "type": "group",
                "all_members_are_administrators": true
                },
        ```
        - Note: Don’t forget the `-` symbol in the group ID.

- Create a **New repository secret** for the chat ID, name it `TELEGRAM_ID`, and paste the ID.

### Final Step: Run the Workflow

- Run your workflow and enjoy!

| <img src="https://github.com/mahdiyarz/persian_flutter_ci_cd/blob/main/doc/images/telegram_group_screenshot.png?raw=true" width='250' alt="Telegram Group Screenshot" /> |
| :------: | 
| Final result in Telegram group |

## Social Links

- **LinkedIn**: [My LinkedIn Profile](https://www.linkedin.com/in/mahdiyar-arbabzi/)
- **GitHub**: [This Project Repository](https://github.com/mahdiyarz/persian_flutter_ci_cd)

## Persian Flutter Community

This project was developed with the support of the Persian Flutter community. Check out their resources:

- **YouTube Channel**: [Persian Flutter Community YouTube](https://www.youtube.com/@PersianFlutter)
- **LinkedIn**: [Persian Flutter Community LinkedIn](https://www.linkedin.com/company/persianflutter/)
- **Telegram Channel**: [Persian Flutter Community Telegram](https://t.me/persian_flutter)


