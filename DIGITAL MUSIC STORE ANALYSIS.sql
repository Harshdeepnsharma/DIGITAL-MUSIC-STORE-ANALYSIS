SELECT* FROM ALBUM


Q.WHO IS THE SENIOR MOST EMPLOYEE BASED ON JOB TITLE?
SELECT* FROM EMPLOYEE
SELECT FIRST_NAME,LAST_NAME,LEVELS,TITLE FROM EMPLOYEE
ORDER BY LEVELS DESC
LIMIT 1

Q.WHICH COUNTRIES HAVE THE MOST INVOICES?
SELECT BILLING_COUNTRY,COUNT(TOTAL)
FROM INVOICE
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

Q.WHICH CITY HAS THE BEST CUSTOMERS?RETURN BOTH CITY NAME & SUM OF INVOICE TOTALS?
SELECT BILLING_CITY,COUNT(TOTAL) 
FROM INVOICE
GROUP BY 1
ORDER BY 2 DESC
LIMIT  1

Q.WHO IS THE BEST CUSTOMER? THE CUSTOMER WHO HAS SPENT THE MOST MONEY WILL BE DECLARED THE BEST
CUSTOMER.WRITE A QUERY THAT RETURNS THE PERSON WHO HAS SPENT THE MOST MONEY.
SELECT CUSTOMER.FIRST_NAME,CUSTOMER.LAST_NAME,SUM(INVOICE.TOTAL) AS TOTAL
FROM CUSTOMER
JOIN INVOICE
ON INVOICE.CUSTOMER_ID=CUSTOMER.CUSTOMER_ID
GROUP BY FIRST_NAME,LAST_NAME
ORDER BY TOTAL DESC
LIMIT 1

Q.WRITE A QUERY TO RETURN THE EMAIL , FIRSTNAME, LASTNAME, & GENRE OF ALL ROCK MUSIC LISTENERS.
RETURN YOUR LIST ORDERED ALPHABETICALLY BY EMAIL STARTING WITH A?
SELECT DISTINCT FIRST_NAME, LAST_NAME, EMAIL
FROM CUSTOMER 
JOIN INVOICE ON CUSTOMER.CUSTOMER_ID=INVOICE.CUSTOMER_ID
JOIN INVOICE_LINE ON INVOICE.INVOICE_ID=INVOICE_LINE.INVOICE_ID
WHERE TRACK_ID IN(
       SELECT TRACK_ID FROM TRACK 
	   JOIN GENRE ON TRACK.GENRE_ID= GENRE.GENRE_ID
	   WHERE GENRE.NAME LIKE 'ROCK'
)
ORDER BY EMAIL ASC;

Q.LETS INVITE THE ARTISTS WHO HAVE WRITTEN THE MOST ROCK MUSIC IN OUR DATASET .WRITE A QUERY THAT 
RETURNS THE ARTIST NAME AND TOTAL TRACK COUNT OF THE TOP 10 ROCK BANDS?
SELECT ARTIST.ARTIST_ID, ARTIST.NAME, COUNT(ARTIST.ARTIST_ID) AS TOTAL_TRACKS
FROM TRACK
JOIN ALBUM ON TRACK.ALBUM_ID = ALBUM.ALBUM_ID
JOIN ARTIST ON ALBUM.ARTIST_ID = ARTIST.ARTIST_ID
JOIN GENRE ON TRACK.GENRE_ID = GENRE.GENRE_ID
WHERE GENRE.NAME LIKE 'ROCK'
GROUP BY ARTIST.NAME, ARTIST.ARTIST_ID
ORDER BY TOTAL_TRACKS ASC
LIMIT 10;





