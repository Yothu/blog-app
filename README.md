![](https://img.shields.io/badge/Microverse-blueviolet)

# BLOG APP

> Blog Web Application that holds posts per user. 

## Built With

- Ruby
- Ruby on Rails
- RSpec, PostgreSQL

## Configuration

To use this project you first need to have installed the following:

+ Node.js
+ Ruby
+ PostgreSQL
+ Rails

* Ruby version

The version of ruby that is needed for this project is 

+ 2.7.0

Once you have installed them, you need to use the following command to clone the repository:

```git clone https://github.com/Yothu/blog-app.git```

### Database creation

Next, use this command to create the databases:
```rake db:create```

Use this command to run the migrations if necesessary:
```rails db:migrate```

### Email detection

Some of the authentication pages of this project send emails for email confirmation and password modification.

Use this command to install **mailcatcher**, a package that lets you catch and see the emails sent by the authentication pages.
```gem install mailcatcher```

Then use this command to run it:
```mailcatcher```

Enter this address in the browser to use mailcatcher:
```http://127.0.0.1:1080```

or

```smtp://127.0.0.1:1025```

## Usage

Finally, use the following command to initialize the live server:

```rails s```

## API endpoints

POST a User

```curl localhost:3000/api/v1/signup -H "Content-Type: application/json" -d '{ "user": { "name": "[NAME]","email": "EMAIL","password": "[PASSWORD]" } }'```

GET all Users

```curl localhost:3000/api/v1/users -H "Authorization: [AUTH TOKEN]"```

GET a User

```curl localhost:3000/api/v1/users/[USER ID] -H "Authorization: [AUTH TOKEN]"```

GET all Post of a User

```curl localhost:3000/api/v1/users/[USER ID]/posts -H "Authorization: [AUTH TOKEN]"```

GET a Post of a User

```curl localhost:3000/api/v1/users/[USER ID]/posts/[POST ID] -H "Authorization: [AUTH TOKEN]"```

GET all Comments of a Post of a User

```curl localhost:3000/api/v1/users/[USER ID]/posts/[POST ID]/comments -H "Authorization: [AUTH TOKEN]"```

GET a Comment of a Post of a User

```curl localhost:3000/api/v1/users/[USER ID]/posts/[POST ID]/comments/[COMMENT ID] -H "Authorization: [AUTH TOKEN]"```

POST a Comment in a Post of a User with your Account

```curl localhost:3000/api/v1/users/[USER ID]/posts/[POST ID]/comments -H "Content-Type: application/json" -H "Authorization: [AUTH TOKEN]" -d '{ "text": "we did it!" }'```

## Testing

To check the test use the following command:

```bundle exec rspec ./spec```

## Author

👤 David Vergaray

- GitHub:   [@Yothu](https://github.com/Yothu)
- Twiter:   [@Daivhy](https://twitter.com/Daivhy)
- LinkedIn: [David Vergaray](https://www.linkedin.com/in/david-vergaray-almontes-051a11127/)

## Collaborators

👤 **Sahar Abdel Samad**

- GitHub: [@sahar-abdelsamad](https://github.com/Sahar-AbdelSamad)
- Twitter: [@abdelsamadsahar](https://twitter.com/AbdelSamadSahar)
- LinkedIn: [sahar-abdel-samad](https://www.linkedin.com/in/sahar-abdel-samad/)

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Thanks to my family for their suport.

## 📝 License

This project is [MIT](./MIT.md) licensed.

