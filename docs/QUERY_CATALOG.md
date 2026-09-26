# Query Catalog

The canonical implementation is in [`sql/Freelancing_Marketplace.sql`](../sql/Freelancing_Marketplace.sql).

The script contains eleven practical query scenarios:

1. freelancer revenue from completed payments
2. order counts by status
3. full order report through the `Order_Report` view
4. freelancers with multiple skills
5. orders with pending payments
6. clients tied for the highest number of orders and their total amount
7. gigs priced above the average gig price
8. freelancer ratings in descending order
9. total income for all freelancers
10. freelancers with Python skills
11. most experienced freelancer

It also defines two triggers, two stored procedures, six indexes, and one view.
