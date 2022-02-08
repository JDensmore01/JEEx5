/**
 * 
 */
package edu.nbcc.person;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import edu.nbcc.course.Course;

/**
 * @author jason
 *
 */
public class Person {
	private int id;
	private String firstName;
	private String lastName;
	private String emailAddress;
	private double salary;
	private List<Person> mockData;
	
	public Person() {
		mockData = new ArrayList<Person>();
		
		mockData.add(new Person(mockData.size() + 1, "Johnny", "Bravo", "HeyMomma@huah.ca", 50000));
		mockData.add(new Person(mockData.size() + 1, "Norman", "Bonez", "boneplate@gmail.com", 52000));
		mockData.add(new Person(mockData.size() + 1, "Cindy", "Crey", "IAintCray@hotmail.com", 42000));
		mockData.add(new Person(mockData.size() + 1, "Sally", "Gonzalez", "sGonzas@live.ca", 65000));
		mockData.add(new Person(mockData.size() + 1, "Jack", "Barrows", "JaBa85@outlook.com", 150000));
		mockData.add(new Person(mockData.size() + 1, "Jack", "Nicholson", "JackNicholson@gmail.com", 82000));
	}
	
	public Person(int id, String firstName, String lastName, String emailAddress, double salary) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailAddress = emailAddress;
		this.salary = salary;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}
	
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	
	public double getSalary() {
		return salary;
	}
	
	public void setSalary(double salary) {
		this.salary = salary;
	}

	public List<Person> getPeople() {
		return mockData;
	}
	
	public Person getPerson(int id) {
		List<Person> person =  mockData.stream().filter(p -> p.id == id).collect(Collectors.toList());
		
		return person.size() > 0 ? person.get(0) : null;
	}
}
