# flutter_flavors

How to do flavors in a easy way for Flutter (At the moment, set up for **android only**).

## Flavors available in this project
1) DEVELOPMENT
2) PRODUCTION

## Add flavors in a Android Project

Go to **android/app/build.gradle** and add another flavor type in the highlighted section

![image](https://user-images.githubusercontent.com/45671820/105180435-57c08480-5b09-11eb-83e8-1de6329ac802.png)

## Running the project through command line

```
flutter run --flavor flavortype -t lib/main_file_from_specific_flavor_type.dart

```

## Running the projet through VS Code

the **.vscode/launch.json** is set to run both flavors in debug mode: development and production. If you want to add another flavor in this section, add the needed infos in the **launch.json** "configurations" list as you can see below:

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "APP - DEVELOPMENT",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_dev.dart",
            "args": [
                "--flavor",
                "development",
                "--enable-software-rendering"
            ]
        },
        {
            "name": "APP - PRODUCTION",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "args": [
                "--flavor",
                "production",
                "--enable-software-rendering"
            ]
        }
    ]
}

```

And then your new flavor will appear in the "Run" area.

![image](https://user-images.githubusercontent.com/45671820/105176866-9acc2900-5b04-11eb-9ec2-756dd0f6a485.png)

## Development x Production Environment
![Sem título](https://user-images.githubusercontent.com/45671820/105181608-c94d0280-5b0a-11eb-92de-b3b9eba7f113.png)

