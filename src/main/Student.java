package main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Student {
	String name;
	List<LocalDate> speeches;
	List<LocalDate> passes;

	public Student() {
		name = "";
		speeches = new ArrayList<LocalDate>();
		passes = new ArrayList<LocalDate>();
	}

	public Student(String name) {
		this.name = name;
		speeches = new ArrayList<LocalDate>();
		passes = new ArrayList<LocalDate>();
	}

	public String getName() {
		return name;
	}

	public List<LocalDate> getSpeeches() {
		return speeches;
	}

	public List<LocalDate> getPasses() {
		return passes;
	}
}
