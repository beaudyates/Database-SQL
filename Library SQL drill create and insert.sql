USE MASTER
GO

IF EXISTS (SELECT * FROM sys.databases WHERE [name] = 'dbLibrary_SQL_Drill')
DROP DATABASE dbLibrary_SQL_Drill
GO

CREATE DATABASE dbLibrary_SQL_Drill
GO

USE dbLibrary_SQL_Drill
GO

CREATE TABLE PUBLISHER
(
PublisherName varchar(100) PRIMARY KEY,
[Address] varchar(200) NOT NULL,
Phone char(12) NOT NULL
);

CREATE TABLE LIBRARY_BRANCH
(
Branchid char(11) PRIMARY KEY,
BranchName varchar(50) NOT NULL,
[Address] varchar(200) NOT NULL 
);

CREATE TABLE BORROWER
(
CardNo char(11) PRIMARY KEY,
Name varchar(100) NOT NULL,
[Address] varchar(200) NOT NULL,
Phone char(12) NOT NULL
);

CREATE TABLE BOOK
(
Bookid char(10) PRIMARY KEY,
Title varchar(100) NOT NULL,
PublisherName varchar(100),
FOREIGN KEY (PublisherName) REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_AUTHORS
(
Bookid char(10),
AuthorName varchar(100) NOT NULL,
FOREIGN KEY (Bookid) REFERENCES BOOK(Bookid),
);

CREATE TABLE BOOK_COPIES
(
Bookid char(10),
Branchid char(11),
No_Of_Copies tinyint NOT NULL,
FOREIGN KEY (Bookid) REFERENCES BOOK(Bookid),
FOREIGN KEY (Branchid) REFERENCES LIBRARY_BRANCH(Branchid)
);

CREATE TABLE BOOK_LOANS
(
Bookid char(10),
Branchid char(11),
CardNo char(11),
DateOut date NOT NULL,
DueDate date NOT NULL,
FOREIGN KEY (Bookid) REFERENCES BOOK(Bookid),
FOREIGN KEY (Branchid) REFERENCES LIBRARY_BRANCH(Branchid),
FOREIGN KEY (CardNo) REFERENCES BORROWER(CardNo)
);

INSERT INTO PUBLISHER (PublisherName, [Address], Phone)
VALUES ('Anchor', '16452 Greenwich St Garden City, NY  11530', '516-393-9967'),
		('CreateSpace Independent Publishing', '40 Cambridge Ave Madison, WI  53715', '608-967-7194'),
		('Dial Press', '20113 4th Ave E Kearny, NJ  07032', '201-431-2989'),
		('Europa Editions', '6 Ridgewood Center Dr Old Forge, PA  18518', '570-648-3035'),
		('Farrar Straus Giroux', '469 Outwater Ln San Diego, CA  92126', '858-617-7834'),
		('Hackett Publishing', '62 Monroe St Thousand Palms, CA  92276', '760-616-5388'),
		('Harcourt Brace Jovanovich', '3338 A Lockport Pl #6 Margate City, NJ  08402', '609-373-3332'),
		('Penguin Books', '9 Hwy Providence, RI  02906', '401-465-6432'),
		('Penguin Classics', '8284 Hart St Abilene, KS  67410', '785-347-1805'),
		('Picador', '5 Washington St #1 Roseville, CA  95678', '916-920-3571'),
		('Random House', '8 S Haven St Daytona Beach, FL  32114', '386-248-4118'),
		('Riverhead Books', '9 Front St Washington, DC  20001', '202-646-7516'),
		('Vintage', '1933 Packer Ave #2 Novato, CA  94945', '415-423-3294'),
		('Wordsworth Editions Ltd', '67 Rv Cent Boise, ID  83709', '208-709-1235');
		
INSERT INTO LIBRARY_BRANCH (Branchid, BranchName, [Address])
VALUES ('GVH80SPE5FF', 'Sharpstown', '251 Park Ave #979 Saratoga, CA  95070'),
		('SFS78FTJ4DP', 'Central', '43496 Commercial Dr #29 Cherry Hill, NJ  08003'),
		('GXD82BMV1YY', 'Jefferson', '2184 Worth St Hayward, CA  94545'),
		('FVV27BKL0PD', 'Madison', '50126 N Plankinton Ave Longwood, FL  32750'),
		('UWL69XIA5MU', 'Washington', '38773 Gravois Ave Cheyenne, WY  82001');
		
INSERT INTO BORROWER (CardNo, Name, [Address], Phone)
VALUES ('XIT56WWQ6ZF', 'James Butt', '6649 N Blue Gum St New Orleans, LA  70116', '504-621-8927'),
		('VMC26CDH5WK', 'Josephine Darakjy', '4 B Blue Ridge Blvd Brighton, MI  48116', '810-292-9388'),
		('EMM13YHL3QC', 'Art Venere', '8 W Cerritos Ave #54 Bridgeport, NJ  08014', '856-636-8749'),
		('ZGO93GMQ7YY', 'Lenna Paprocki', '639 Main St Anchorage, AK  99501', '907-385-4412'),
		('JKJ25XMV8KW', 'Donette Foller', '34 Center St Hamilton, OH  45011', '513-570-1893'),
		('YJM37FNF4HA', 'Simona Morasca', '3 Mcauley Dr Ashland, OH  44805', '419-503-2484'),
		('FOK62UPN5VO', 'Mitsue Tollner', '7 Eads St Chicago, IL  60632', '773-573-6914'),
		('WJR22CHF1OT', 'Leota Dilliard', '7 W Jackson Blvd San Jose, CA  95111', '408-752-3500'),
		('ROD27FED5HB', 'Sage Wieser', '5 Boston Ave #88 Sioux Falls, SD  57105', '605-414-2147'),
		('ZPC08DGD2DG', 'Kris Marrier', '228 Runamuck Pl #2808 Baltimore, MD  21224', '410-655-8723'),
		('DXY37KKO8BJ', 'Minna Amigon', '2371 Jerrold Ave Kulpsville, PA  19443', '215-874-1229'),
		('UPO02YLO8VV', 'Abel Maclead', '37275 St  Rt 17m M Middle Island, NY  11953', '631-335-3414'),
		('ZUS70XLW1VQ', 'Kiley Caldarera', '25 E 75th St #69 Los Angeles, CA  90034', '310-498-5651'),
		('KTR88XNW9RF', 'Graciela Ruta', '98 Connecticut Ave NW Chagrin Falls, OH  44023', '440-780-8425');
		
INSERT INTO BOOK (Bookid, Title, PublisherName)
VALUES ('1400078431', 'The Year of Magical Thinking', 'Vintage'),
		('1514109670', 'The Lost Tribe', 'CreateSpace Independent Publishing'),
		('1594482420', 'In Persuasion Nation', 'Riverhead Books'),
		('1609450787', 'My Brilliant Friend', 'Europa Editions'),
		('1840226358', 'Ulysses', 'Wordsworth Editions Ltd'),
		('0140449272', 'The Symposium', 'Penguin Classics'),
		('0141439548', 'Middlemarch', 'Penguin Classics'),
		('0143127551', 'Everything I Never Told You', 'Penguin Books'),
		('0156907399', 'To the Lighthouse', 'Harcourt Brace Jovanovich'),
		('0241965594', 'White Teeth', 'Vintage'),
		('0307278441', 'The Bluest Eye', 'Vintage'),
		('0307455920', 'Americanah', 'Anchor'),
		('0307743667', 'Carrie', 'Anchor'),
		('0307947726', 'The Sense of an Ending', 'Vintage'),
		('0312421273', 'The Corrections', 'Picador'),
		('0312424094', 'Housekeeping', 'Picador'),
		('0345806875', 'Dept. of Speculation', 'Vintage'),
		('0374529752', 'The Sabbath', 'Farrar Straus Giroux'),
		('0385343760', 'Kurt Vonnegut: Letters', 'Dial Press'),
		('0679732764', 'Invisible Man', 'Vintage'),
		('0804172706', 'A Little Life', 'Anchor '),
		('0812976533', 'Midnight’s Children', 'Random House'),
		('0872202836', 'On the Genealogy of Morality', 'Hackett Publishing'),
		('1784700886', 'Lives of Girls and Women', 'Vintage');

INSERT INTO BOOK_AUTHORS (Bookid, AuthorName)
VALUES ('1400078431', 'Joan Didion'),
		('1514109670', 'Matthew Caldwell'),
		('1594482420', 'George Saunders'),
		('1609450787', 'Elena Ferrante'),
		('1840226358', 'James Joyce'),
		('0140449272', 'Plato'),
		('0141439548', 'George Eliot'),
		('0143127551', 'Celeste Ng'),
		('0156907399', 'Zadie Smith'),
		('0307278441', 'Toni Morrison'),
		('0307455920', 'Chimamanda Ngozi Adichie'),
		('0307743667', 'Stephen King'),
		('0307947726', 'Julian Barnes'),
		('0312421273', 'Jonathan Franzen'),
		('0312424094', 'Marilynne Robinson'),
		('0345806875', 'Jenny Offill'),
		('0374529752', 'AJ Heschel'),
		('0385343760', 'Dan Wakefield'),
		('0679732764', 'Ralph Ellison'),
		('0804172706', 'Hanya Yanagihara'),
		('0812976533', 'Salman Rushdie'),
		('0872202836', 'Friedrich Nietzsche'),
		('1784700886', 'Alice Munro');

INSERT INTO BOOK_COPIES (Bookid, Branchid, No_Of_Copies)
VALUES ('1400078431', 'GVH80SPE5FF', 3),
		('1400078431', 'GXD82BMV1YY', 3),
		('1400078431', 'FVV27BKL0PD', 4),
		('1514109670', 'SFS78FTJ4DP', 3),
		('1514109670', 'UWL69XIA5MU', 4),
		('1514109670', 'GXD82BMV1YY', 4),
		('1594482420', 'GVH80SPE5FF', 4),
		('1594482420', 'SFS78FTJ4DP', 3),
		('1594482420', 'UWL69XIA5MU', 4),
		('1609450787', 'GVH80SPE5FF', 4),
		('1609450787', 'SFS78FTJ4DP', 4),
		('1609450787', 'GXD82BMV1YY', 4),
		('1840226358', 'GVH80SPE5FF', 5),
		('1840226358', 'SFS78FTJ4DP', 5),
		('1840226358', 'GXD82BMV1YY', 5),
		('1840226358', 'FVV27BKL0PD', 5),
		('1840226358', 'UWL69XIA5MU', 5),
		('0140449272', 'GXD82BMV1YY', 4),
		('0140449272', 'FVV27BKL0PD', 4),
		('0140449272', 'UWL69XIA5MU', 4),
		('0141439548', 'GVH80SPE5FF', 4),
		('0141439548', 'SFS78FTJ4DP', 4),
		('0141439548', 'GXD82BMV1YY', 4),
		('0141439548', 'UWL69XIA5MU', 4),
		('0143127551', 'GXD82BMV1YY', 4),
		('0143127551', 'FVV27BKL0PD', 4),
		('0143127551', 'UWL69XIA5MU', 4),
		('0156907399', 'GVH80SPE5FF', 4),
		('0156907399', 'FVV27BKL0PD', 4),
		('0156907399', 'UWL69XIA5MU', 4),
		('0241965594', 'SFS78FTJ4DP', 4),
		('0241965594', 'GXD82BMV1YY', 4),
		('0241965594', 'FVV27BKL0PD', 4),
		('0307278441', 'GVH80SPE5FF', 4),
		('0307278441', 'FVV27BKL0PD', 4),
		('0307278441', 'UWL69XIA5MU', 4),
		('0307455920', 'GVH80SPE5FF', 4),
		('0307455920', 'SFS78FTJ4DP', 4),
		('0307455920', 'FVV27BKL0PD', 4),
		('0307743667', 'GVH80SPE5FF', 4),
		('0307743667', 'SFS78FTJ4DP', 4),
		('0307743667', 'GXD82BMV1YY', 4),
		('0307743667', 'FVV27BKL0PD', 4),
		('0307743667', 'UWL69XIA5MU', 4),
		('0307947726', 'GXD82BMV1YY', 4),
		('0307947726', 'FVV27BKL0PD', 3),
		('0307947726', 'UWL69XIA5MU', 3),
		('0312421273', 'GVH80SPE5FF', 4),
		('0312421273', 'FVV27BKL0PD', 4),
		('0312421273', 'UWL69XIA5MU', 3),
		('0312424094', 'GVH80SPE5FF', 4),
		('0312424094', 'SFS78FTJ4DP', 3),
		('0312424094', 'FVV27BKL0PD', 3),
		('0345806875', 'SFS78FTJ4DP', 4),
		('0345806875', 'FVV27BKL0PD', 4),
		('0345806875', 'UWL69XIA5MU', 4),
		('0374529752', 'GVH80SPE5FF', 4),
		('0374529752', 'GXD82BMV1YY', 4),
		('0374529752', 'UWL69XIA5MU', 4),
		('0385343760', 'SFS78FTJ4DP', 4),
		('0385343760', 'GXD82BMV1YY', 4),
		('0385343760', 'FVV27BKL0PD', 4),
		('0385343760', 'UWL69XIA5MU', 4),
		('0679732764', 'GVH80SPE5FF', 5),
		('0679732764', 'SFS78FTJ4DP', 5),
		('0679732764', 'GXD82BMV1YY', 5),
		('0679732764', 'FVV27BKL0PD', 5),
		('0679732764', 'UWL69XIA5MU', 5),
		('0804172706', 'SFS78FTJ4DP', 4),
		('0804172706', 'GXD82BMV1YY', 4),
		('0804172706', 'FVV27BKL0PD', 4),
		('0812976533', 'GVH80SPE5FF', 4),
		('0812976533', 'FVV27BKL0PD', 4),
		('0812976533', 'UWL69XIA5MU', 4),
		('0872202836', 'SFS78FTJ4DP', 4),
		('0872202836', 'GXD82BMV1YY', 4),
		('0872202836', 'FVV27BKL0PD', 4),
		('1784700886', 'GVH80SPE5FF', 3),
		('1784700886', 'SFS78FTJ4DP', 3),
		('1784700886', 'UWL69XIA5MU', 3),
		('1514109670', 'GVH80SPE5FF', 0),
		('1514109670', 'FVV27BKL0PD', 0);

;

INSERT INTO BOOK_LOANS (Bookid, Branchid, CardNo, DateOut, DueDate)
VALUES ('1400078431', 'GVH80SPE5FF', 'XIT56WWQ6ZF', '2016-10-30', '2016-11-19'),
		('1594482420', 'GVH80SPE5FF', 'XIT56WWQ6ZF', '2016-10-30', '2016-11-19'),
		('1784700886', 'GVH80SPE5FF', 'XIT56WWQ6ZF', '2016-10-30', '2016-11-19'),
		('0679732764', 'GVH80SPE5FF', 'XIT56WWQ6ZF', '2016-10-30', '2016-11-19'),
		('1609450787', 'GVH80SPE5FF', 'XIT56WWQ6ZF', '2016-10-30', '2016-11-19'),
		('1840226358', 'GVH80SPE5FF', 'XIT56WWQ6ZF', '2016-11-01', '2016-11-21'),
		('0307743667', 'GVH80SPE5FF', 'XIT56WWQ6ZF', '2016-11-01', '2016-11-21'),
		('0241965594', 'FVV27BKL0PD', 'KTR88XNW9RF', '2016-11-06', '2016-11-26'),
		('0307743667', 'FVV27BKL0PD', 'KTR88XNW9RF', '2016-11-06', '2016-11-26'),
		('0312424094', 'FVV27BKL0PD', 'KTR88XNW9RF', '2016-11-06', '2016-11-26'),
		('0385343760', 'FVV27BKL0PD', 'KTR88XNW9RF', '2016-11-06', '2016-11-26'),
		('0872202836', 'FVV27BKL0PD', 'KTR88XNW9RF', '2016-11-06', '2016-11-26'),
		('0156907399', 'FVV27BKL0PD', 'KTR88XNW9RF', '2016-11-06', '2016-11-26'),
		('0307947726', 'UWL69XIA5MU', 'VMC26CDH5WK', '2016-11-09', '2016-11-29'),
		('0307278441', 'UWL69XIA5MU', 'VMC26CDH5WK', '2016-11-09', '2016-11-29'),
		('0307743667', 'UWL69XIA5MU', 'VMC26CDH5WK', '2016-11-09', '2016-11-29'),
		('0679732764', 'UWL69XIA5MU', 'VMC26CDH5WK', '2016-11-09', '2016-11-29'),
		('1514109670', 'SFS78FTJ4DP', 'EMM13YHL3QC', '2016-11-03', '2016-11-23'),
		('1609450787', 'SFS78FTJ4DP', 'EMM13YHL3QC', '2016-11-03', '2016-11-23'),
		('0241965594', 'SFS78FTJ4DP', 'EMM13YHL3QC', '2016-11-03', '2016-11-23'),
		('0679732764', 'GXD82BMV1YY', 'ZGO93GMQ7YY', '2016-11-08', '2016-11-28'),
		('0804172706', 'GXD82BMV1YY', 'ZGO93GMQ7YY', '2016-11-08', '2016-11-28'),
		('0141439548', 'GXD82BMV1YY', 'ZGO93GMQ7YY', '2016-11-08', '2016-11-28'),
		('0312421273', 'GVH80SPE5FF', 'JKJ25XMV8KW', '2016-11-14', '2016-12-04'),
		('1609450787', 'GVH80SPE5FF', 'JKJ25XMV8KW', '2016-11-14', '2016-12-04'),
		('0812976533', 'GVH80SPE5FF', 'JKJ25XMV8KW', '2016-11-14', '2016-12-04'),
		('0312424094', 'SFS78FTJ4DP', 'YJM37FNF4HA', '2016-10-30', '2016-11-19'),
		('1840226358', 'SFS78FTJ4DP', 'YJM37FNF4HA', '2016-10-30', '2016-11-19'),
		('0241965594', 'SFS78FTJ4DP', 'YJM37FNF4HA', '2016-10-30', '2016-11-19'),
		('1840226358', 'GXD82BMV1YY', 'FOK62UPN5VO', '2016-11-15', '2016-12-15'),
		('0140449272', 'GXD82BMV1YY', 'FOK62UPN5VO', '2016-11-15', '2016-12-15'),
		('0241965594', 'GXD82BMV1YY', 'FOK62UPN5VO', '2016-11-15', '2016-12-05'),
		('0679732764', 'FVV27BKL0PD', 'WJR22CHF1OT', '2016-11-01', '2016-11-21'),
		('0385343760', 'FVV27BKL0PD', 'WJR22CHF1OT', '2016-11-01', '2016-11-21'),
		('0345806875', 'FVV27BKL0PD', 'WJR22CHF1OT', '2016-11-01', '2016-11-21'),
		('0812976533', 'UWL69XIA5MU', 'ROD27FED5HB', '2016-11-01', '2016-11-21'),
		('0345806875', 'UWL69XIA5MU', 'ROD27FED5HB', '2016-11-01', '2016-11-21'),
		('0156907399', 'UWL69XIA5MU', 'ROD27FED5HB', '2016-11-01', '2016-11-21'),
		('1594482420', 'UWL69XIA5MU', 'ROD27FED5HB', '2016-11-01', '2016-11-21'),
		('1840226358', 'GVH80SPE5FF', 'ZPC08DGD2DG', '2016-11-10', '2016-11-30'),
		('0141439548', 'GVH80SPE5FF', 'ZPC08DGD2DG', '2016-11-10', '2016-11-30'),
		('0156907399', 'GVH80SPE5FF', 'ZPC08DGD2DG', '2016-11-10', '2016-11-30'),
		('0307278441', 'GVH80SPE5FF', 'ZPC08DGD2DG', '2016-11-10', '2016-11-30'),
		('0307455920', 'GVH80SPE5FF', 'ZPC08DGD2DG', '2016-11-10', '2016-11-30'),
		('0312424094', 'FVV27BKL0PD', 'DXY37KKO8BJ', '2016-11-01', '2016-11-21'),
		('0345806875', 'FVV27BKL0PD', 'DXY37KKO8BJ', '2016-11-01', '2016-11-21'),
		('0312421273', 'FVV27BKL0PD', 'DXY37KKO8BJ', '2016-11-01', '2016-11-21'),
		('0307455920', 'FVV27BKL0PD', 'DXY37KKO8BJ', '2016-11-01', '2016-11-21'),
		('0307278441', 'FVV27BKL0PD', 'DXY37KKO8BJ', '2016-11-01', '2016-11-21'),
		('1784700886', 'FVV27BKL0PD', 'DXY37KKO8BJ', '2016-11-01', '2016-11-21');




















































































































































































































































































































 






 














		 





		 

 









		 





