[![Build Status](https://travis-ci.com/jobannon/upvote_api.svg?branch=master)](https://travis-ci.com/jobannon/upvote_api)

For further documentation regarding the scope and functionality of this API, please review the repository supporting the Front-End - [Here](https://github.com/jobannon/upvote_ui)
## Hosted
  - [Heroku](https://upvote-ideas.herokuapp.com/)

## Endpoints
  
<strong>Ideas</strong>
* get '/cohorts/ideas'
  * returns the index of all ideas in a Cohort

* post '/cohorts/ideas/new'
  * post a new idea  
  
* get '/cohorts/ideas/:id'
  * show an idea

* post '/cohorts/ideas/:id/edit'
  * edit an idea

* post '/cohorts/ideas/:id/delete'
  * delete an idea

<strong>Votes</strong> 
* post '/cohorts/ideas/:id'
  * 'create' a vote

<strong>Statistics</strong>
* get '/statistics'
  * 'show' current statistics

<strong>Login/Logout/OAuth</strong>
* get '/logout' 
  * logout and destroy the session

* get 'auth/github'
  * login thru OAuth

* get '/auth/github/callback'
  * login thru OAuth
* get '/current_user'
  * get to current user

Data for all endpoints are exposed under an `api` and version (`v1`) namespace (e.g., `/api/v1/cohorts`), returned in JSON format.

## Contributors
* [jobannon](https://github.com/jobannon)
* [freeheeling](https://github.com/freeheeling)
* [hale4029](https://github.com/hale4029)


