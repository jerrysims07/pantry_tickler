User Stories
============

Creating New Records
--------------------
* As a homemaker, I want to be able to add items so that staple items, ideal inventory amount, and number of days to empty are more reflective of my personal situation.
### Acceptance Criteria
1. User will type a '-a' modifier to get into the add module. 
2. Two arguments will be required with add module. Those are the item name and the ideal inventory amount
3. User will receive a message that their data was added successfully and see that data mirrored back to them.

Reading Existing Records
------------------------
* As a homemaker, I want to be able to quickly view what items I may be running low on to ensure that nothing is missed.
### Acceptance Criteria
1.  User will type "-list" to get a list of all items that at 7 days of inventory or less.
2.  Optionally, the user may add an integer argument to specify the number of days to empty the report should return.
3.  A list will be printed suggesting items that the user's pantry may be running low on.
* As a homemaker, I want to be able to search for average rates of consumption of items to better inform my decision making regarding pantry inventory numbers.
## Acceptance Criteria
1. User will type "-avg" to get a the average rate of consumption for a specific item.
2. User will be required to add an argument which will be the search term for the item name field.
3. A list of potential matches will be returned along with their average rates of consumption.

Updating Existing Records
-------------------------
* As a homemaker, I want to be able to update the default consumption rates of items to better reflect my family's needs so that the resulting reports are closer to our actual usage.
## Acceptance Criteria
1. User will type "-edit" to access the edit/update module.
2. The user will be required to add an argument which will be the search term used for the item name field.
3. The user will be prompted with possibly multiple search results to specify which one they are interested in updating.
4. The user will then enter the rate of consumption they would like to use.

Deleting Records From Database
------------------------------
* As the homemaker, I want to be able to delete items from the database so that there are no unwanted items that continuously show up on grocery lists.  
## Acceptance Criteria
1. The user will type a -delete modifier to enter the delete module.
2. The user will include a search term for the item name field.
3. A list of possible matches will be displayed and will allow the user to then type in comma-separated values of the all the items they would like to delete from the database.
* As the homemaker, I want to be able to delete entries so that there is recourse when I make an error in my data-entry.
## Acceptance Criteria
1. 1. The user will type a -delete modifier to enter the delete module.
2. The user will include a search term for the item name field.
3. A list of possible matches will be displayed and will allow the user to then type in comma-separated values of the all the items they would like to delete from the database.

