import java.awt.*;
import java.util.*;
import java.awt.event.*;
import javax.swing.*;
import java.sql.*;

public class OwnQueries extends JFrame implements ActionListener {
	JTextArea outputArea;
	QueryTable tableResults;
	Connection con;
	final static int NUM_BUTTONS = 8;
	JButton queryButton[] = new JButton[NUM_BUTTONS];;

	// ++//++//++//++//++//++//++//++//++//++//++//++//++//++
	// add more prepared statements here if you need more
	PreparedStatement prepStat0, prepStat1, prepStat2, prepStat3, prepStat4;

	// ++//++//++//++//++//++//++//++//++//++//++//++//++//++

	// ///////////////////////////////////////////////////////////////
	// Constructor sets up frame with
	// an area for SQL entry
	// a table for results
	public OwnQueries(Connection conn) {
		// Initialise frame
		super("SQL Query");
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				dispose();
			}
		});
		setSize(650, 600);
		createButtons();
		createTableAndTextArea();

		// connect to database and prepare some statements
		con = conn;
		prepareStatements();
	}

	// places table in center and text area in south
	public void createTableAndTextArea() {

		// Set QueryTable in scrollpane in centre of layout
		// Results from the query will be stored here
		tableResults = new QueryTable();
		JTable table = new JTable(tableResults);
		JScrollPane scrollpane = new JScrollPane(table);
		getContentPane().add(scrollpane, BorderLayout.CENTER);

		// Add text area
		outputArea = new JTextArea("", 8, 50);
		JScrollPane scroll = new JScrollPane(outputArea);
		add(scroll, BorderLayout.SOUTH);
	}

	public void createButtons() {
		// Create upper panels for label, text area and buttons
		JPanel p1 = new JPanel();
		p1.setLayout(new GridLayout(8, 1));

		// ++//++//++//++//++//++//++//++//++//++//++//++//++//++
		// change the button texts in this section
		queryButton[0] = new JButton(
				"Return Member details with membership type, using giving ID.");
		queryButton[1] = new JButton("Number of Bookings for a class.");
		queryButton[2] = new JButton(
				"Display those members with more than 1 booking.");
		queryButton[3] = new JButton("Update the salary of staff.");
		queryButton[4] = new JButton(
				"Return Staff name with chosen gender and salary.");
		queryButton[5] = new JButton("Change membership status by name.");
		queryButton[6] = new JButton("Insert then delete value in Members.");
		queryButton[7] = new JButton(
				"Returns what members take each type of class.");
		// ++//++//++//++//++//++//++//++//++//++//++//++//++//++

		// add buttons to panel - don't change this
		for (int count = 0; count < NUM_BUTTONS; count++) {
			queryButton[count].addActionListener(this);
			p1.add(queryButton[count]);
		}
		add(p1, BorderLayout.NORTH);
	}

	// ++//++//++//++//++//++//++//++//++//++//++//++//++//++
	// set up all your prepared statements here
	public void prepareStatements() {
		// used in process0
		String prepquery0 = "SELECT Members.*, MembershipTypes.type FROM Members INNER JOIN MembershipTypes"
				+ " ON Members.memberID = MembershipTypes.memberID WHERE Members.memberID = ?";
		// used in process1
		String prepquery1 = "SELECT COUNT(classID) AS NumberOfBookingsForClassID1 FROM ClassBookings WHERE classID=? ";
		// used in process5
		String prepquery2 = "SELECT firstName, surname FROM Staff "
				+ " WHERE salary < ? AND gender IN (?)";

		// the next 2 queries used in process 7
		String prepquery3 = "Select Members.firstName, Members.surname from Members, Classes, ClassBookings, MemberBookings  "
				+ " WHERE Members.memberID = MemberBookings.memberID AND MemberBookings.bookingID = ClassBookings.bookingID AND ClassBookings.classID = Classes.classID AND className = ?";
		// this one gets the types to go into a dropdown list
		String prepquery4 = "Select DISTINCT className FROM Classes";
		// ++//++//++//++//++//++//++//++//++//++//++//++//++//++

		// prepares the statements once
		try {
			prepStat0 = con.prepareStatement(prepquery0);
			prepStat1 = con.prepareStatement(prepquery1);
			prepStat2 = con.prepareStatement(prepquery2);
			prepStat3 = con.prepareStatement(prepquery3);
			prepStat4 = con.prepareStatement(prepquery4);
		} catch (SQLException e) {
			outputArea.setText(e.getMessage());
		}
	}

	// ///////////////////////////////////////////////////////////////
	// Handles all actions from the GUI
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == queryButton[0])
			process0();
		else if (e.getSource() == queryButton[1])
			process1();
		else if (e.getSource() == queryButton[2])
			process2();
		else if (e.getSource() == queryButton[3])
			process3();
		else if (e.getSource() == queryButton[4])
			process4();
		else if (e.getSource() == queryButton[5])
			process5();
		else if (e.getSource() == queryButton[6])
			process6();
		else if (e.getSource() == queryButton[7])
			process7();

	}

	// ++//++//++//++//++//++//++//++//++//++//++//++//++//++
	// ++//++//++//++//++//++//++//++//++//++//++//++//++//++
	// PUT YOUR OWN CODE INTO EACH PROCESS
	// alter the comments!
	// DELETE EXISTING CODE IF YOU don't use all the buttons

	// selects some data and puts it into the table

	/*
	 * Uses prepared statement 0 to return the details about a member including
	 * the Membership Type by the user inputting the member ID.
	 */
	public void process0() {

		try {
			// get balance limit from user
			String s = JOptionPane.showInputDialog(this,
					"Enter the members ID: ");
			// if data entered
			if (s != null) {
				// convert from text to integer
				int sInt = Integer.parseInt(s);
				// set parameter in prepared statement
				prepStat0.setInt(1, sInt);
				// run query and obtain result set
				ResultSet resSet = prepStat0.executeQuery();
				// output heading including limit

				tableResults.formatTable(resSet);
			}
			// if user cancelled, clear both output area and table
			else {
				outputArea.setText("no input entered");
				tableResults.clearTable();
			}

		} catch (SQLException e) {
			outputArea.setText(e.getMessage());
		}

	}

	/*
	 * Uses prepared statement 1 to take in a class ID and outputs the number of
	 * bookings for that class attend that class
	 */
	public void process1() {

		try {
			// get balance limit from user
			String s = JOptionPane
					.showInputDialog(this, "Enter the class ID: ");
			// if data entered
			if (s != null) {
				// convert from text to integer
				int sInt = Integer.parseInt(s);
				// set parameter in prepared statement
				prepStat1.setInt(1, sInt);
				// run query and obtain result set
				ResultSet resSet = prepStat1.executeQuery();
				// output heading including limit
				outputArea.setText("Number of booking for class " + sInt
						+ " = ");
				// loop for each result
				while (resSet.next()) {
					// display type in text area - type is in first column of
					// result
					outputArea.append(resSet.getString(1) + "\n");
					// clear table (not using it)
					tableResults.clearTable();
				}
			}
			// if user cancelled, clear both output area and table
			else {
				outputArea.setText("no input entered");
				tableResults.clearTable();
			}

		} catch (SQLException e) {
			outputArea.setText(e.getMessage());
		}

	}

	/*
	 * Displays the surname of all members that have more that one booking.
	 */
	public void process2() {
		String query = "SELECT Members.surname, COUNT(MemberBookings.bookingID) AS NumberOfBookings FROM Members "
				+ "INNER JOIN MemberBookings ON MemberBookings.memberID=Members.memberID GROUP BY surname "
				+ "HAVING COUNT(MemberBookings.memberID) >= 2";
		try {
			// create statements
			Statement s1 = con.createStatement();
			// run query and store results in result set
			ResultSet resSet = s1.executeQuery(query);
			// clear table
			tableResults.clearTable();
			// display in text area
			tableResults.formatTable(resSet);

		} catch (SQLException e) {
			outputArea.setText(e.getMessage());
		}

	}

	// AN UPDATE QUERY
	/*
	 * Takes in the staff ID and a new salary number then updates the current
	 * salary of that member of staff to the new salary.
	 */
	public void process3() {
		try {
			String stf = JOptionPane.showInputDialog(this,
					"Enter the Staff ID: ");
			int stfInt = Integer.parseInt(stf);
			String sal = JOptionPane
					.showInputDialog(this, "Enter new Salary: ");
			int salInt = Integer.parseInt(sal);
			// create statement
			Statement stmt = con.createStatement();
			// define update
			String updateQuery = "UPDATE Staff SET salary = " + salInt
					+ " WHERE staffID = " + stfInt;
			String query = "SELECT * FROM Staff WHERE staffID = " + stfInt;
			// run update and get how many rows affected
			int howManyRowsUpdated = stmt.executeUpdate(updateQuery);
			// output heading
			if (howManyRowsUpdated == 0)
				outputArea.setText("Failed to update\n");
			else
				outputArea.setText("Successfully updated\n");
			// output how many rows updated
			outputArea.append("Rows updated = " + howManyRowsUpdated + "\n");
			Statement s1 = con.createStatement();
			// run query and store results in result set
			ResultSet resSet = s1.executeQuery(query);
			// clear table
			tableResults.clearTable();
			// display in text area
			tableResults.formatTable(resSet);
			// clear table - not using it

		} catch (SQLException e) {
			outputArea.setText(e.getMessage());
		}
	}

	/*
	 * User inputs a max salary and a gender, it then outputs the fist name and
	 * surname of the staff members.
	 */
	public void process4() {

		try {

			// Define heading
			outputArea
					.append("This query lists staff names with given salary limit and gender\n");

			// valid types are current, deposit, mortgage, investment
			String sal = JOptionPane.showInputDialog(this,
					"Enter an salary limit : ");
			String dep = JOptionPane.showInputDialog(this, "Enter gender : ");
			if (sal != null && dep != null) {

				// supply the parameter(s)
				prepStat2.setInt(1, Integer.parseInt(sal)); // convert to
															// integer
				prepStat2.setString(2, dep);
				// execture the query
				ResultSet resSet = prepStat2.executeQuery();

				// print heading including parameters
				outputArea
						.setText("These are the names of employees earning less than "
								+ sal + " with gender " + dep + "\n");
				tableResults.clearTable();
				while (resSet.next()) {
					tableResults.formatTable(resSet);
					
				}
			} else {
				outputArea.setText("no input entered");
				tableResults.clearTable();
			}
		} catch (SQLException e1) {
			outputArea.setText(e1.getMessage());
		} catch (NumberFormatException nfe) { // this error message could be
												// more precise
			outputArea.setText("Number Format Error " + nfe.getMessage());
		}
	}

	/*
	 * User inputs the first name, surname and a new membership type.
	 * The membership type is then updated and the member information it then outputted.
	 */
	public void process5() {

		try {
			String query = "SELECT Members.*, MembershipTypes.type FROM Members INNER JOIN MembershipTypes"
					+ " ON Members.memberID = MembershipTypes.memberID ";
			Statement s1 = con.createStatement();
			// run query and store results in result set
			ResultSet resSet = s1.executeQuery(query);
			// clear table
			tableResults.clearTable();
			// display in text area
			tableResults.formatTable(resSet);
			String first = JOptionPane.showInputDialog(this,
					"Enter Members first name : ");
			String last = JOptionPane.showInputDialog(this,
					"Enter Members last name : ");
			String type = JOptionPane.showInputDialog(this,
					"Enter members new membership type : ");
			// create statement
			Statement stmt = con.createStatement();
			// define update
			String updateQuery = "UPDATE MembershipTypes SET type = '" + type
					+ "' WHERE memberID IN "
					+ "(SELECT memberID FROM Members WHERE surname = '" + last
					+ "' AND firstName = '" + first + "' )";

			// run update and get how many rows affected
			int howManyRowsUpdated = stmt.executeUpdate(updateQuery);
			// output heading
			if (howManyRowsUpdated == 0)
				outputArea.setText("Failed to update\n");
			else
				outputArea.setText("Successfully updated\n");
			// output how many rows updated
			outputArea.append("Rows updated = " + howManyRowsUpdated + "\n");
			s1 = con.createStatement();
			// run query and store results in result set
			resSet = s1.executeQuery(query);
			// clear table
			tableResults.clearTable();
			// display in text area
			tableResults.formatTable(resSet);
			// clear table - not using it

		} catch (SQLException e) {
			outputArea.setText(e.getMessage());
		}
	}

	// DELETE/ INSERTION
	// just reports how many rows altered
	// you can view the table from the main switchboard to see the result in the
	// records
	public void process6() {
		try {
			// create a statement
			Statement stmt = con.createStatement();

			// define an insert
			String insertQuery = "INSERT INTO Members VALUES "
					+ " (NULL,'Donald','Trump','White House','Washington', 'DC20500','1946-06-14','M')";
			// execute the insert and find how many rows affected
			int howManyRowsInserted = stmt.executeUpdate(insertQuery);
			// output heading
			outputArea.append("Trying to insert project temp2\n");
			// output how many rows inserted
			outputArea.append("Rows inserted = " + howManyRowsInserted + "\n");

			// maybe put a query here to prove it

			// define a delete
			String delQuery = "DELETE FROM Members WHERE firstName = 'Donald'";
			// execute the delete and find how many rows affected
			int howManyRowsDeleted = stmt.executeUpdate(delQuery);
			// set up heading
			outputArea.append("Trying to delete project temp2\n");
			// output result
			outputArea.append("Rows deleted = " + howManyRowsDeleted + "\n");

			// clear table - not using it
			tableResults.clearTable();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	/*
	 * Runs one query to get the list of class names
	 * then the user chooses one
	 * then a list of first and surnames in that class are displayed.
	 */
	public void process7() {
		try {
			
			ResultSet resSet = prepStat4.executeQuery();
			// define an array to hold all the names
			ArrayList<String> params = new ArrayList<String>();
			// loop through the result set and get out the names
			int count = 0;
			while (resSet.next()) { // whilst more
				// add result data to array
				params.add(resSet.getString(1));
				count++;
			}
			// find number of types in the result set
			int size = params.size();
			// define an array to populate the drop down list
			Object[] possibilities = new Object[size];
			// copy the types into the drop down list
			for (int c = 0; c < size; c++) {
				possibilities[c] = params.get(c);
			}
			// get name from the user
			String s = (String) JOptionPane.showInputDialog(this, "Choose",
					"Choose", JOptionPane.QUESTION_MESSAGE, null,
					possibilities, // list of values
					possibilities[0]); // default

			// If a string was returned
			if ((s != null) && (s.length() > 0)) {
				// set parameter in the query
				prepStat3.setString(1, s);
				// run the query to find all employees in this department
				resSet = prepStat3.executeQuery();
				// display in table
				tableResults.formatTable(resSet);
				outputArea.setText("list of members in class = " + s);
			} else {
				tableResults.clearTable();
				outputArea.setText("No selection made");
			}

		} catch (SQLException ex) {
			outputArea.setText(ex.getMessage());
		}
	}

}