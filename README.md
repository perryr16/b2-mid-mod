# README

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.1.7.

RSpec and Shoulda-Matchers have been installed and set up.


# Overview
We are creating an application to track movies. We have studios, which have movies, and movies have several actors, and actors can be in several movies.
one studio - many movies
many movies - many actors

Studios have a name and location
Movies have a title, creation year, and genre
Actors have a name and age

You will need to create all the migrations. You do not need to do model testing for validations, just make sure you test any relationships and model methods that you create. Our goal for you is to get through User Story 3 during these three hours.

Instructions
* Work on this assessment independently. DO NOT discuss with anyone.
* Complete the stories below
* Commit Frequently
* Push your code to your fork once the time is up (not before!)

Read each story carefully.

Story 1 - STUDIO INDEX - show movies
As a visitor,
When I visit the studio index page
I see a list of all of the movie studios
And underneath each studio, I see the names of all of its movies.

Story 2 - MOVIE SHOW - show actors (ordered/avg'd)
As a visitor,
When I visit a movie's show page.
I see the movie's title, creation year, and genre,
and a list of all its actors from youngest to oldest.
And I see the average age of all of the movie's actors

Story 3 - MOVIE SHOW - FORM - EXISTING actor - redirect back - see actor
As a visitor,
When I visit a movie show page,
I see a form for an actors name
and when I fill in the form with an existing actor's name
I am redirected back to that movie's show page
And I see the actor's name listed
(This should not break story 3, You do not have to test for a sad path)


Extension:

Story 4 - ACTOR SHOW - list all quniq actors they've worked with
As a visitor,
When I visit an actor's show page
I see that actors name and age
And I see a unique list of all of the actors this particular actor has worked with.
