# MijnCMD
This is the backend repository for the mijncmd application. It's currently running on docker so make sure you have docker running (Or if you don't like docker, make the right changes).

Notice that the application is structured in a custom non phoenix way. The GraphQL logic is placed inside a separate folder (not the web folder) due to readability. Also the web folder is downscaled drastically. I placed most of the preloading in the types due to easier integration in relations, I'm really sorry if this is not the way to go! All the mutations are processed inside a model made folder with the right name in the `mijncmd` folder. Some actions have duplicate code due to making things work, sorry!

> Be careful, if you want to release this application please change the domain name inside the image view for web. This is needed by the image uploader for the frontend!

To run the application, simply run `docker-compose up` in your terminal and the application will start. If everything went OK, you can find your API at `http://mijncmd.backend.localhost/`

> Be aware that port 4000 and 5432 cannot be in use, otherwise the application won't start.
