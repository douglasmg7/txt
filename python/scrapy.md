# Scrapy

## Install
pip install scrapy

## Start a new project
scrapy startproject new_project

## Run scrapy sub-class
scrapy crawl name

## Overwrite
scrapy crawl quotes -O quotes.json

## Append using json line
scrapy crawl quotes -0 quotes.jl

## Interactive mode
scrapy shell 'http://quotes.toscrape.com/page/1/'
scrapy shell ./uai.html
response.css('title')
response.css('span.news::text')[6].get()

