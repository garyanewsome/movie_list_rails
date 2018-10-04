# MOVIE LIST CODE CHALLENGE - RIVERS AGILE

## Dependencies:
- Ruby 2.3.0
- Rails 5.2.0
- Postgres
- NPM

## To run this app:
- `git clone` this repo
- `rake db:setup`
- `bundle`
- `npm i`
- `rails s`
- visit `http://localhost:3000` in your browser

## To test:
- `rspec`

## The rundown:
This app allows you to create a `movie list`. As well as create `movies` and add them to lists. Movies can be entered manually, or created using the OMDB api.  

The `movie_list` table has a nested movie table that can be made visible by clicking the non-faded movie real icon at the front of the row.  

The `movie_list` and `movie` table are both searchable and filterable, by using the search box at the top of the table, or clicking the column headers to change the order of the rows.

## Known Issues
The datatables library, seems to be having an occasional hicup while navigating through the site. If you do not see the search box at the top of the table, simply refresh the page to reload the table.
