User Stories
============

Creating New Records
--------------------
* As a homemaker, I want to be able to add items so that staple items, ideal inventory amount, and next purchase date are more reflective of my personal situation.

### Acceptance Criteria

1. User will include the "add" command on the command line to get into the add module. 
2. Two arguments will be required with add module. Those are the item name and the ideal inventory amount
3. User will receive a message that their data was added successfully and see that data mirrored back to them.

* As a homemaker, I want to be able to add purchases to keep the inventory amounts updated with new additions.

### Acceptance Criteria

1. User will include the "purchase" command on the command line to get into the purchase module. 
2. Two arguments will be required with purchase module. Those are the item name and the days of stock purchased.
3. A third optional argument would be date of purchase. If omitted, the date of purchase will default to today's date.
3. User will receive a message that their data was added successfully and see that data mirrored back to them.

* Since purchases are primarily made in large quantities, the user will be able to import multiple purchases by import.

### Acceptance Criteria

1. User will created a comma separated file with the item name and the amount purchased for that item.
2. User will type 'import' command on the command line with the --filename option to begin the import.



Reading Existing Records
------------------------
* As a homemaker, I want to be able to quickly view what items I may be running low on to ensure that nothing is missed.

### Acceptance Criteria

1.  User will include the "print" command to enter the print module.
2.  The user must add an integer argument with the "--shopping_days" option to specify the number of days to empty the report should return.
3.  A list will be printed suggesting items that the user's pantry may be running low on.



Updating Existing Records
-------------------------
* As a homemaker, I want to be able to update the current inventory on hand of items to better reflect family's actual usage.

### Acceptance Criteria

1. User will type "set" to access the edit/update module.
2. The user will be required to add an argument which will be the search term used for the item name field.
3. An optional argument can be included to set the date at which this inventory amount was updated. If omitted, it will default to today's date.
4. The user will be prompted with possibly multiple search results to specify which one they are interested in updating.

* As the homemaker, I should be able to periodically inventory my pantry and update it en masse.

### Acceptance Criteria

1. User will created a comma separated file with the item name and the new days on hand number for that item.
2. User will type 'inventory' command on the command line with the --filename option to begin the import.


Deleting Records From Database
------------------------------
* As the homemaker, I want to be able to delete items from the database so that there are no unwanted items that continuously show up on grocery lists.  

### Acceptance Criteria

1. The user will type 'delete' modifier to enter the delete module.
2. The user will include the --name option and the item name which will be used as the search term against the database.
3. The results of the delete attempt will be displayed.

