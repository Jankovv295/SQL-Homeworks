use HomeWorks

--? Change Products table always to insert value 1 in price
--column if no price is provided on insert

alter table dbo.Products 
add constraint DF_PRoducts_Price
default (1) for [Price]

select * from Products

SET IDENTITY_INSERT Products ON;
insert into Products (Id, [Name]) values (44, 'Sugar')

--? Change Products table to prevent inserting Price that will
--more than 2x bigger then the cost price

alter table dbo.Products 
with check
add constraint CH_PRoducts_Price
CHECK (price < cost * 2)

insert into Products (Id, [Name],Cost, Price) values (46, 'Butter1', 20, 50)

--? Change Products table to guarantee unique names across
--the products

alter table dbo.Products 
with check
add constraint UNQ_PRoducts_Name
Unique ([Name])


insert into Products (Id, [Name]) values (47, 'Sugar')