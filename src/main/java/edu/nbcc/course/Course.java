package edu.nbcc.course;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 
 * @author jason
 *
 */
public class Course {
	
	private int id;
	private String name;
	private int term;
	private List<Course> courses;
	

	public Course() {
		courses = new ArrayList<Course>();
		
		courses.add(new Course(courses.size() + 1, "Course 1", 1));
		courses.add(new Course(courses.size() + 1, "Course 2", 2));
		courses.add(new Course(courses.size() + 1, "Course 3", 3));
		courses.add(new Course(courses.size() + 1, "Course 4", 4));
		courses.add(new Course(courses.size() + 1, "Course 5", 5));
		courses.add(new Course(courses.size() + 1, "Course 6", 6));
		courses.add(new Course(courses.size() + 1, "Course 7", 7));
	}
	
	public Course(int id, String name, int term) {
		this.id = id;
		this.name = name;
		this.term = term;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getTerm() {
		return this.term;
	}
	
	public void setTerm(int term) {
		this.term = term;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}	

	public Course getCourse(int id) {
		List<Course> course = courses.stream().filter(c -> c.getId() == id).collect(Collectors.toList());;
		
		if (course.size() > 0) {
			return course.get(0);
		}
		return null;
	}
	
}