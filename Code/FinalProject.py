# Ayman Madani
# 101237659
# 2023 December 10
# COMP 3005 A

# need to install psycopg2 using this command:
# pip install psycopg2

import psycopg2

# Establish a connection to the database
conn = psycopg2.connect(
    dbname='HealthAndFitness',
    user='Aymanm',
    password='password',
    host='localhost'
)

# Create a cursor object
cur = conn.cursor()

with open('tableCreation.sql', 'r') as file:
    ddlFile = file.read()

# Creates all tables table
cur.execute(ddlFile)


with open('initialValues.sql', 'r') as file:
    initialValues = file.read()

# Insert initial data
cur.execute(initialValues)

# save changes
conn.commit()

# Get Functions
def getTable(tableName):
    print("All "+ tableName +":")
    cur.execute("SELECT * FROM " + tableName)
    rows = cur.fetchall()
    for row in rows:
        print(row)
    print()
    
def getMember(memberID):
    cur.execute("SELECT Name FROM Member WHERE MemberID = %s", (memberID,))
    rows = cur.fetchall()
    for row in rows:
        memberName = row[0]
    
    return memberName

def getTransactions(memberID):
    print("All Transactions from", getMember(memberID) + ":")
    cur.execute("SELECT * FROM Transaction WHERE MemberID = %s", (memberID,))
    rows = cur.fetchall()
    for row in rows:
        print(row)
    print()

def getFitnessGoals(memberID):
    print("All Fitness Goals from", getMember(memberID) + ":")
    cur.execute("SELECT Description FROM FitnessGoal WHERE MemberID = %s", (memberID,))
    rows = cur.fetchall()
    for row in rows:
        print(row)
    print()

def getHealthMetrics(memberID):
    print("All Health Metrics from", getMember(memberID) + ":")
    cur.execute("SELECT * FROM HealthMetric WHERE MemberID = %s", (memberID,))
    rows = cur.fetchall()
    for row in rows:
        print(row)
    print()

def getProgressNotes(memberID):
    print("All Progress Notes from", getMember(memberID) + ":")
    cur.execute("SELECT Content FROM ProgressNote WHERE MemberID = %s", (memberID,))
    rows = cur.fetchall()
    for row in rows:
        print(row)
    print()
    
def getPassword(userLVL, userID):
    cur.execute("SELECT Password FROM "+ userLVL + " WHERE "+ userLVL +"ID = %s", (userID,))
    rows = cur.fetchall()
    for row in rows:
        userPassword = row[0]
    
    return userPassword

def getAll():
    getTable("Member")
    getTable("Trainer")
    getTable("Admin")
    getTable("Session")
    getTable("Transaction")
    getTable("FitnessGoal")
    getTable("HealthMetric")
    getTable("ProgressNote")
    getTable("Equipment")
    getTable("CheckedDates")


# Adds a new Member
def addMember(name, email, password):

        # Checks to make sure no email is the same
        cur.execute("SELECT Email FROM Member")
        emails = cur.fetchall()
        for emailList in emails:
            if emailList[0] == email:
               print("ERROR: A Member with this email already exists.")
               return
        
        cur.execute(
            "INSERT INTO Member (Name, Email, Password, LoyaltyPoints) VALUES (%s, %s, %s, %s)",
            (name, email, password, "0",)
        )
        conn.commit()

# Updates a user's Password
def updatePassword(userLVL, newPassword, userID):
    cur.execute(
        "UPDATE "+ userLVL +" SET Password = %s WHERE "+ userLVL +"ID = %s",
        (newPassword, userID,)
    )
    conn.commit()

#deletes a Member
def deleteMember(memberID):
    cur.execute("DELETE FROM Member WHERE MemberID = %s", (memberID,))
    conn.commit()


option = 0
# runs application infinitly until user decides to quit
while option != 5:
    print("APPLICATION MENU OPTIONS:")
    print("1. Show Table.")
    print("2. Add a Member.")
    print("3. Update Password.")
    print("4. Delete Member.")
    print("5. Quit\n")
    
    #Makes sure user is inputing a proper option
    while option < 1 or option > 5:
        option = int(input("What would you like to do? (Enter Menu Option Number): "))
        if option < 1 or option > 5:
            print("Please Enter a Valid Option!")
    
    print()
    
    # cases for each option
    if option == 1:
        
        print("Tables:")
        print("1. Members.")
        print("2. Trainers.")
        print("3. Admins.")
        print("4. Sessions.")
        print("5. Transactions.")
        print("6. Fitness Goals.")
        print("7. Health Metrics.")
        print("8. Progress Notes.")
        print("9. Equipment.")
        print("10. Checked Dates.")
        print("11. Show All Tables.\n")
        
        tableOption = 0
        while tableOption < 1 or tableOption > 10:
            tableOption = int(input("Which Table Would You Like To See? (Enter Table Number): "))
            if tableOption < 1 or tableOption > 10:
                print("Please Enter a Valid Option!")
                
        if tableOption == 1:
            getTable("Member")
        elif tableOption == 2:
            getTable("Trainer")
        elif tableOption == 3:
            getTable("Admin")
        elif tableOption == 4:
            getTable("Session")
        elif tableOption == 5:
            getTable("Transaction")
        elif tableOption == 6:
            getTable("FitnessGoal")
        elif tableOption == 7:
            getTable("HealthMetric")
        elif tableOption == 8:
            getTable("ProgressNote")
        elif tableOption == 9:
            getTable("Equipment")
        elif tableOption == 10:
            getTable("CheckedDates")
        elif tableOption == 11:
            getAll()

        print("\n")
        option = 0
    elif option == 2:
        print("You have chosen to add a new Member.\nFollow the Instructions on Screen.\n")
        name = input("Enter Member's Name: ")
        email = input("Enter Member Email: ")
        password = input("Create Member Password: ")
        addMember(name, email, password)
        print("\n")
        option = 0
    elif option == 3:
        print("You have chosen to Update Your Password.\nFollow the Instructions on Screen.\n")
        user = ""
        while user.lower() != "member" and user.lower() != "trainer" and user.lower() != "admin":
            user = input("Are you a Member, Trainer, or Admin?\n")
            if user.lower() != "member" and user.lower() != "trainer" and user.lower() != "admin":
                print("Please Enter a Valid Option!")
                
        userID = input("Enter Your ID:")
        prevPass = ""
        while prevPass != getPassword(user, userID):
            prevPass = input("Enter Previous Password: ")
            if prevPass != getPassword(user, userID):
                print("Incorrect Password!")
        newPass = input("Enter New Password: ")
        updatePassword(user, newPass, userID)
        print("\n")
        option = 0
    elif option == 4:
        print("You have chosen to Delete a Member.\nFollow the Instructions on Screen.\n")
        memberID = input("Enter Member ID: ")
        deleteMember(memberID)
        print("\n")
        option = 0
    elif option == 5:
        print("Goodbye!")
        conn.commit()
        


# Close the cursor and connection
cur.close()
conn.close()