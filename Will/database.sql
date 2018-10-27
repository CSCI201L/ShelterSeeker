/* Added availability to shelterInfo*/

DROP DATABASE IF EXISTS shelterSeeker;
CREATE DATABASE shelterSeeker;
USE shelterSeeker;
CREATE TABLE users (
	userID INT(11) PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    pass VARCHAR(255) NOT NULL,
    isShelter BIT NOT NULL DEFAULT 0
    );
CREATE TABLE userInfo (
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
    zipcode INT(5),
    kids INT(3),
    pets INT(3),
    phoneNumber INT(15),
	FOREIGN KEY (id) REFERENCES users(userID)
);

CREATE TABLE messages (
	messageID INT(11) PRIMARY KEY AUTO_INCREMENT,
    senderID INT (11) NOT NULL,
    recipientID INT (11) NOT NULL,
    timeSent INT (11) NOT NULL,
    mSubject VARCHAR (255),
    mContent TEXT,
	mRead BIT NOT NULL DEFAULT 0,
    FOREIGN KEY (senderID) REFERENCES users(userID),
    FOREIGN KEY (recipientID) REFERENCES users(userID)
    
);

CREATE TABLE shelterInfo (
	id INT (11) PRIMARY KEY,
    zipcode INT(5) NOT NULL,
    kids INT(3),
    pets INT(3),
    phoneNumber INT(15) NOT NULL,
    biography TEXT,
    numRatingGiven INT(11),
    nearGrocery BIT NOT NULL DEFAULT 0,
    nearPharmacy BIT NOT NULL DEFAULT 0,
    nearLaundromat BIT NOT NULL DEFAULT 0,
    currentRating DOUBLE (3,2) DEFAULT 5, 
    pageVisits INT (11) NOT NULL DEFAULT 0,
    numStays INT (11) NOT NULL DEFAULT 0,
    numPendingRequests INT (11) NOT NULL DEFAULT 0,
    avgStayDuration DOUBLE (8,2) NOT NULL DEFAULT 0,
    availability INT(11),
    FOREIGN KEY (id) REFERENCES users(userId)
);

