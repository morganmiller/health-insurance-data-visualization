## DREAMS

* √ Locate source of information we can consume
* √ Prove we can consume it
* √ Save it somehow (database, file...)
* √ Choose API
* √ plans index: GET request to `/plans` returns JSON for each plan
  ```
  [{"id": 1, "state": "AK", "child_premium": 123, "plan_type": "PPO"},
   {"id": 2, "state": "AL", "child_premium": 456, "plan_type": "HMO"}
  ]
  ```
* √ plan show: GET request to `/plans/id` returns JSON for each plan / 404 if id DNE
  ```
  GET /plans/2
  {"id": 2, "state": "AL", "child_premium": 456, "plan_type": "HMO"}
  ```
* √ Add the tests we need to feel confident in it
* √ Allow the db to be persisted
* √ Rake tasks for scraping and importing
* Importing shouldn't duplicate data

## DETAILS

The plan data show premiums for the following rating scenarios:

Child -- one child any age
Adult individual age 21, 27, 30, 40, 50, and 60
Couple age 21, 30, 40, 50, and 60, no children
Couple age 21, 30, 40, and 50, plus 1 child
Couple age 21, 30, 40, and 50, plus 2 children
Couple age 21, 30, 40, and 50, plus 3 or more children
Single parent age 21, 30, 40, and 50, plus 1 child
Single parent age 21, 30, 40, and 50, plus 2 children
Single parent age 21, 30, 40, and 50, plus 3 or more children

Source: https://www.healthcare.gov/health-plan-information/

