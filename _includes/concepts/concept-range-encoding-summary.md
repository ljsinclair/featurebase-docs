When range encoding, all values greater than a specific value are set to 1.
This means:
* each subsequent bitmap contains information about the specific value
* fewer bitmaps are required to query values above and below that value
* fewer `OR` operators are required a given query.
