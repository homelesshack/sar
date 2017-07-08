Hello

### JSON structure exposed to frontend

```json
[
  {
    "brma": "Some Name",
    "government_allowance": 590,
    "results": {
      "spareroom": {
        "total_results": 1099,
        "highest_rent": 830,
        "lowest_rent": 80,
        "mean_rent": 394,
        "median_rent": 215,
        "rooms_below_threshold": 5
      }
    },
    "number_rooms": 1099,
    "rooms_below_threshhold": 5
  }
]
```

### brma
Broad Rental Market Areas

### User flow
User enters postcode
User hits submit
Calculate BRMA from postcode (cache)
Get goverment allowance from BRMA
Scrape Spareroom to get number of result pages
Scrape each Spareroom page and grab rent prices
Calculate Spareroom average rent for postcode
Compare discrepancy between goverment allowance and Spareroom average
Present to user

# Rails

Install manual for OSX and Ubuntu.

## On Ubuntu 17.04
```sh
sudo apt install docker-compose
```
On **Ubuntu** I had to use `sudo` for the following commands. On **OSX** you should not.

## Booting the app

```sh
docker-compose up
```

Install ruby bundles
```sh
sh rails.sh bundle install
```

Create the database
```sh
sh rails.sh bundle exec rake db:create
sh rails.sh bundle exec rails db:migrate
```

```sh
sh rails.sh
```

## Running commands

```sh
sh rails.sh bundle exec rails db:migrate
```

## Deploying

```sh
git subtree push --prefix app heroku master
```
