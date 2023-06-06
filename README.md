# Planet Rental App

Welcome to the Planet Rental App! This Rails application is a clone of Airbnb, but with a unique twist: it allows users to rent planets. Whether you're an intergalactic traveler or a space enthusiast, this app provides a platform to explore and book your dream planet.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Routes](#routes)
- [Models](#models)
- [Controllers](#controllers)
- [Views](#views)
- [Contributing](#contributing)
- [License](#license)

## Features

The Planet Rental App offers the following features:

- User authentication and authorization
- Listing and searching for available planets
- Booking a planet for a specific period
- Viewing all available planets

## Getting Started

To get started with the Planet Rental App, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/planet-rental-app.git`
2. Change into the project directory: `cd planet-rental-app`
3. Install the dependencies: `bundle install`
4. Set up the database: `rails db:setup`
5. Start the server: `rails server`

You're now ready to use the Planet Rental App!

## Usage

Once the server is up and running, you can access the app by navigating to `http://localhost:3000` in your web browser. From there, you can explore the various features of the app.

### Login

To access certain features, such as listing a new planet or making a booking, you need to log in. Click on the "Login" link and enter your credentials. If you don't have an account, you can sign up for a new one.

### List New Planet

Logged-in users can list their own planets for rental. Click on the "List New Planet" button and fill out the required information, such as planet name, description, location, and rental price.

### Make a Booking

To book a planet, search for available planets using the search functionality provided. Once you find a planet you're interested in, click on it to view more details. If the planet is available for the desired dates, you can book it by selecting the start and end dates and confirming the booking.

### See All Planets

To browse through all available planets, click on the "All Planets" link. This will display a list of all planets currently listed on the platform. You can use filters and sorting options to narrow down your search.

## Routes

The Planet Rental App defines the following routes:

| HTTP Verb | Path                   | Controller#Action     |
|-----------|------------------------|-----------------------|
| GET       | /                      | home#index            |
| GET       | /login                 | sessions#new          |
| POST      | /login                 | sessions#create       |
| DELETE    | /logout                | sessions#destroy      |
| GET       | /signup                | users#new             |
| POST      | /signup                | users#create          |
| GET       | /planets               | planets#index         |
| GET       | /planets/new           | planets#new           |
| POST      | /planets               | planets#create        |
| GET       | /planets/:id           | planets#show          |
| GET       | /planets/:id/bookings  | bookings#new          |
| POST      | /planets/:id/bookings  | bookings#create       |
| GET       | /bookings              | bookings#index        |

## Models

The Planet Rental App includes the following models:

- User
  - Attributes: id,

 email, password_digest
  - Associations: has_many :planets, has_many :bookings

- Planet
  - Attributes: id, name, description, location, rental_price, user_id
  - Associations: belongs_to :user, has_many :bookings

- Booking
  - Attributes: id, start_date, end_date, planet_id, user_id
  - Associations: belongs_to :user, belongs_to :planet

## Controllers

The Planet Rental App includes the following controllers:

- HomeController: Handles the home page and basic routes.
- SessionsController: Manages user authentication and login sessions.
- UsersController: Handles user registration and account management.
- PlanetsController: Controls the CRUD operations for planets.
- BookingsController: Manages bookings for planets.

## Views

The views directory contains the following folders:

- home: Contains the views for the home page.
- sessions: Contains the views for user authentication and login sessions.
- users: Contains the views for user registration and account management.
- planets: Contains the views for listing, searching, and booking planets.
- bookings: Contains the views for managing bookings.

## Contributing

We welcome contributions to improve the Planet Rental App. To contribute, follow these steps:

1. Fork the repository
2. Create a new branch
3. Make your changes
4. Test your changes
5. Submit a pull request

Please ensure your code adheres to our coding conventions and is accompanied by relevant tests.

## License

The Planet Rental App is open source and released under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code as per the terms of the license.

We hope you enjoy using the Planet Rental App! If you have any questions or feedback, please don't hesitate to contact us.
