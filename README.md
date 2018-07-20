# FURever
#### Centralised Animal Adoption
:dog2:**Mission:** to be the go to place to Adopt an Animal into your family.

Visit the app at: https://furevr-app.herokuapp.com/

## Technical Information
#### Backend
This application is run using:
* Ruby 2.5.1
* Rails 5.2.0
* Postgresql 10.4

#### Frontend
* Bootstrap v4.1.2

### Dependencies
* [au-pet-api](https://au-pet-api.herokuapp.com/) [\[git repo\]](https://github.com/zailleh/aus_pet_crawler)

### Database Setup
As mentioned above, the database in use is PostgreSQL. After cloning the repo, assuming you have PostgreSQL already running, simply run the below:
```
rails db:create && rails db:migrate && rails db:seed
```
*For Heroku deployment, `rails db:create` can be omitted*

### Services 
This app currently uses a two Rails`ActiveJob`s to read data from the *au-pet-api*, called `FetchPetsJob` and `FetchSheltersJob`. These jobs will run automatically  1 minute after startup and every hour thereafter.

To run the jobs manually, in the Rails concole, run:
```
FetchPetsJob.perform_now
FetchSheltersJob.perform_now
```