import scrapy
import pandas as pd
from pymongo import MongoClient

class Spider(scrapy.Spider):
    name = "stats"
    allowed_domains = ["en.wikipedia.org"]
    start_urls = ["https://en.wikipedia.org/wiki/List_of_football_clubs_in_England"]

    mongo_client = MongoClient('localhost', 27017)
    db = mongo_client['mydb']
    collection = db['football_clubs']
    data = []

    def parse(self, response):
        tables = response.xpath('//table[@class="wikitable sortable"]')
        print(tables)

        for table in tables:
             rows = table.xpath('.//tr')
             for row in rows[1:]:
                 table_data = {}
                 columns = row.xpath('.//td')
                 if len(columns) == 5:
                     table_data['Club'] = columns[0].xpath('.//a/text()').get()
                     table_data['League/Division'] = columns[1].xpath('.//a/text()').get()
                     table_data['Lvl'] = columns[2].xpath('.//text()').get()
                     table_data['Nickname'] = columns[3].xpath('.//text()').get()
                     table_data['Change from 2022–23'] = columns[4].xpath('.//text()').get()
                     self.data.append(table_data)  

    def save_to_csv(self, data):
         try:
             df = pd.DataFrame(data)
             df.to_csv('football_clubs.csv', index=False)
             self.log("Data saved to CSV successfully.")
         except Exception as e:
             self.log(f"Error saving data to CSV: {str(e)}")

    def save_to_mongodb(self, data):
          try:
              self.collection.insert_many(data)
              self.log("Data saved to MongoDB successfully.")
          except Exception as e:
              self.log(f"Error saving data to MongoDB: {str(e)}")

    def closed(self, reason):
         self.save_to_csv(self.data) 
         self.save_to_mongodb(self.data)








        
    

        
