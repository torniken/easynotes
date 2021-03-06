# EasyNotes
![Demo gif](docs/Demo.gif)

## Features
- [x] Save notes
- [x] Tag notes
- [x] Filter by tags
- [x] Login based
- [x] HTTPS

## Requirements
* Python 3
* MongoDB
* Docker
* Flask
* React/React-redux

## Install

```git clone https://github.com/TornikeNatsvlishvili/easynotes.git```

### Set unique properties
#### Set ssl certs
```
# notes.nginx
ssl_certificate <your-fullchain.pem>;
ssl_certificate_key <your-privkey.pem>;
```

#### Set app secret and first user credentials with Docker Secrets

* APP_SECRET
  * default: CHANGE_ME

#### Structure
* Backend (port: 5000)
* Frontend 
    * port: 8080
    * exposes: 8081
* Mongodb (port: 27017)


## License

MIT
