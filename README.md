# Data Acquisition with Gans

## Overview
The purpose of this project is to simulate a data-acquisition pipeline for the fictitious electric scooter rental company Gans. The company wishes to gather some basic information on a few large German cities, as well as daily updates on the weather forecasts and incoming flights for those locations. The data is gathered through a combination of web-scraping and API calls, and then stored to a MySQL database for later analysis.

## Data Sources
Wikipedia pages for [Berlin](https://en.wikipedia.org/wiki/Berlin), [Hamburg](https://en.wikipedia.org/wiki/Hamburg), and [Munich](https://en.wikipedia.org/wiki/Munich)<br>
OpenWeather's [5 day / 3 hour forecast](https://openweathermap.org/api/forecast5?collection=current_forecast)<br>
[AeroDataBox](https://rapidapi.com/aedbx-aedbx/api/aerodatabox)'s '_Search airports by location_' and '_FIDS: Airport departures and arrivals (by time range)_' endpoints

## Secrets
Secret values (database access, API keys) are stored in `.env`, not available in this repository. The file has this form
```
CON_STRING=mysql+pymysql://YOURUSER:YOURPASSWORD@127.0.0.1:3306/gans
OPENWEATHER_KEY=YOURAPIKEY1
RAPIDAPI_KEY=YOURAPIKEY2
```
where `YOURUSER` and `YOURPASSWORD` are to be replaced by your own MySQL username and password; `YOURAPIKEY#` is to be replaced by your own key from the API provider. Once created, `.env` should be kept in the repository's top directory.

`CON_STRING` assumes a locally hosted MySQL server; networked servers can be reached by providing the appropriate IP address in place of `127.0.0.1`. If a different name is chosen for the schema, this must be updated both in `.env` (replace `gans`, line 1) and in `03_gans_schema.sql`, lines 1-4.

## File Structure
The files in this project break down into two categories:
1. Development files, used to work out and test the techniques for data-gathering. These are numbered `01-05`, and should be followed in that order.
2. The final notebook, `99_gans_pipeline.ipynb`, which gathers the tested approaches from each development notebook, wraps each in a function, and distributes function calls across three sections:
    * **Add New Cities**, which targets the database's `'cities'`, `'populations'`, and `'airports'` tables. This section should only be run when Gans expands to new cities.
    * **Occassional Updates**, which targets the database's `'populations'` and `'airports'` tables. This section should be only be run every few years.
    * **Daily Updates**, which targets the database's `'forecasts'` and `'flights'` tables. This section should be run daily to provide up-to-date information, helping Gans plan the distribution of rental scooters around their target cities. 
