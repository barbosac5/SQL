-- When the user clicks on a certain model (Let’s say Model EcoX) then all the accessory options are displayed
SELECT MODEL_ID, MODEL_NAME, ACCESSORY_NAME, ACCESSORY_DESC, PRICE 
FROM accessories
JOIN model USING(MODEL_ID)
WHERE MODEL_NAME = 'EcoX';


SELECT MAKE_YEAR, BRAND_NAME, MAKE_NAME, MODEL_NAME, BRAND_TYPE, IN_STOCK
FROM model
RIGHT JOIN make ON model.MAKE_ID = make.MAKE_ID
INNER JOIN brand ON make.BRAND_ID = brand.BRAND_ID
WHERE BRAND_NAME =  'Toyota';