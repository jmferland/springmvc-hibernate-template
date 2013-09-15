INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Juergen', 'Hoeller', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Mark', 'Fisher', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Rod', 'Johnson', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'David', 'Syer', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Gunnar', 'Hillert', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Dave', 'McCrory', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Josh', 'Long', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Patrick', 'Chanezon', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Andy', 'Piper', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Eric', 'Bottard', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Chris', 'Richardson', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Raja', 'Rao', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Rajdeep', 'Dua', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Monica', 'Wilkinson', NOW());
INSERT INTO customer(id, firstname, lastname, signupdate) values( nextval( 'hibernate_sequence') , 'Mark', 'Pollack', NOW());

INSERT INTO merchant(id, name, creationdate, securitysender, userlogin, userpassword, channelid) values( nextval( 'hibernate_sequence') , 'COPYandPAY Integration Guide' , NOW() , '696a8f0fabffea91517d0eb0a0bf9c33' , '1143238d620a572a726fe92eede0d1ab' , 'demo' , '52275ebaf361f20a76b038ba4c806991');

INSERT INTO bill(id, merchant_id, customer_id, creationDate, token, amount, currency) values( nextval( 'hibernate_sequence') , (SELECT m.id FROM merchant m WHERE m.name = 'COPYandPAY Integration Guide') , (SELECT c.id FROM customer c WHERE c.firstName = 'Juergen') , NOW() , '01234567890123456789012345678901' , '1143238d620a572a726fe92eede0d1ab' , 1.00 , 'EUR');

INSERT INTO registration(id, customer_id, creationDate, code, brand, bin, last4Digits) values ( nextval( 'hibernate_sequence') , (SELECT c.id FROM customer c WHERE c.firstName = 'Juergen') , NOW() , '01234567890123456789012345678901' , 'VISA' , '420000' , '0000');