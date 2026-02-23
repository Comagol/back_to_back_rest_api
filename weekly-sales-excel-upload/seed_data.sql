-- Seed data for Project 02 - Weekly Sales Excel Upload

INSERT INTO poc_stores (store_code, store_name, region_code, active_yn)
VALUES ('ST001', 'Downtown Store', 'R1', 'Y');

INSERT INTO poc_stores (store_code, store_name, region_code, active_yn)
VALUES ('ST002', 'North Mall Store', 'R1', 'Y');

INSERT INTO poc_stores (store_code, store_name, region_code, active_yn)
VALUES ('ST003', 'Airport Store', 'R2', 'Y');

INSERT INTO poc_product_categories (category_code, category_name, active_yn)
VALUES ('ELECTRONICS', 'Electronics', 'Y');

INSERT INTO poc_product_categories (category_code, category_name, active_yn)
VALUES ('GROCERY', 'Grocery', 'Y');

INSERT INTO poc_product_categories (category_code, category_name, active_yn)
VALUES ('CLOTHING', 'Clothing', 'Y');

INSERT INTO poc_product_categories (category_code, category_name, active_yn)
VALUES ('HOME', 'Home', 'Y');

COMMIT;