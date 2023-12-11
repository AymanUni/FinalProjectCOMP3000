Ayman Madani
101237658
COMP3005
Final Project

Setup Instructions for the database:
	Create a new login/group role:
		Name: Aymanm
		Password: password
		
		Turn on Privileges:
			Can login
			Superuser
			Create roles
			Create databases
	
	Create a new Database:
		Name: HealthAndFitness
		User: Aymanm

Steps to compile and run your application:
Used Python 3.10.6 using visual studio code in demonstration.

	Step 1. You Need to install psycopg2 using this command: pip install psycopg2

	Step 2. Run the python code


Brief explanation of each function:

getTable(tableName): Gets all values from the table given in the parameter and prints them to the terminal.
getMember(memberID): Gets the name of the member with the given ID.
getTransactions(memberID): Gets all the transactions from the member with the given ID
getFitnessGoals(memberID): Gets all the fitness goals from the member with the given ID
getHealthMetrics(memberID): Gets all the Health Metrics from the member with the given ID
getProgressNotes(memberID): Gets all the Progress Notes from the member with the given ID
getPassword(userLVL, userID): gets the password of userLVL(member, trainer, admin) that has the userID
getAll(): Prints all the tables from the database
addMember(name, email, password): Adds a new member to the member table
updatePassword(userLVL, newPassword, userID): Updates the password for a member, trainer, or admin with the specified id.
deleteMember(memberID): Deletes the record of the Member and all its connected values with the specified memberID.


Video Demonstration:
	I forgot to record a part of the demonstation so there is 2 videos.
	Part 1: https://youtu.be/oixTxV1sa3k (7:38)
	Part 2: https://youtu.be/T8uGfXRuSZw (3:52)