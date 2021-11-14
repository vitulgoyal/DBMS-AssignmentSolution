CREATE DEFINER=`root`@`localhost` PROCEDURE `PRICE_CATEGORY`()
BEGIN
	select DISTANCE,PRICE,
    CASE 
		when PRICE > 1000 then 'Expensive Cost'
        when PRICE > 500 AND PRICE < 1000 then 'Average Cost'
        else 'Cheap'
        END AS verdict from PRICE;
END