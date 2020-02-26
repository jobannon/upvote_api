## Endpoints

Data for all endpoints are exposed under an `api` and version (`v1`) namespace (e.g., `/api/v1/cohorts`), returned in JSON format.

- **Root** 
  - https://upvote-ideas.herokuapp.com/

- **Index** `GET /api/v1/<resource>/<resource>` renders all corresponsding records for a given resource
  - https://upvote-ideas.herokuapp.com/api/v1/cohorts
  - https://upvote-ideas.herokuapp.com/api/v1/cohorts/ideas (accessible to authenticated users)
  
- **Show** `GET /api/v1/<resource>/<resource>/:id` renders a single corresponding record for a given resource
  - https://upvote-ideas.herokuapp.com/api/v1/cohorts/ideas/:id (accessible to authenticated users)
  
- **Create Idea** `POST /api/v1/<resource>/<resource>/new`
  - https://upvote-ideas.herokuapp.com/api/v1/cohorts/ideas/new (accessible to authenticated users)
 
- **Create Vote** `POST /api/v1/<resource>/<resource>/:id`
  - https://upvote-ideas.herokuapp.com/api/v1/cohorts/ideas/:id (accessible to authenticated users)

### Relationship Endpoint

Associations between a given record and the resource to which it is connected is exposed via the following endpoint: 

#### Cohort Ideas
```
GET /api/v1/cohorts/ideas     # returns a collection of ideas associated with a cohort
```
