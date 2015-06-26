[![Stories in Ready](https://badge.waffle.io/kennedyr/MarsRover.png?label=ready&title=Ready)](https://waffle.io/kennedyr/MarsRover)
# MarsRover
An action game where you poison zombie nazis on Mars.
A experimental game built with Phaser
---
## About

### Game Mechanics
  ???
---
## Development
Install node
  https://nodejs.org/
Install mongodb
`choco install mongodb`
or
`brew install mongodb`

---

### To run:
```npm install
gulp
```
It'll start at localhost:3000 with the browsersync console at localhost:3002
### To run the API:
Have an instance of mongodb running.
```npm install
npm start
```
It'll start at localhost:8080/api/
Use Postman in Chrome to manually query the REST api.
---
The master branch is automatically deployed to Azure whenever it gets pushed to github.
Use develop or a feature branch for development work.

The frontend code is written in coffeescript and dependencies are managed with require js.

---

live example: http://marsrover.azurewebsites.net
