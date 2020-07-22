package main;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Student {
	private String name;
	private List<LocalDateTime> speeches;
	private List<LocalDateTime> passes;

	public Student() {
		name = "";
		speeches = new ArrayList<LocalDateTime>();
		passes = new ArrayList<LocalDateTime>();
	}

	public Student(String name) {
		this.name = name;
		speeches = new ArrayList<LocalDateTime>();
		passes = new ArrayList<LocalDateTime>();
	}

	public String getName() {
		return name;
	}

	public List<LocalDateTime> getSpeeches() {
		return speeches;
	}

	public List<LocalDateTime> getPasses() {
		return passes;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSpeeches(List<LocalDateTime> speeches) {
		this.speeches = speeches;
	}

	public void setPasses(List<LocalDateTime> passes) {
		this.passes = passes;
	}

	@Override
	public String toString() {
		String result = "";
		result += "name: " + name + "\n";
		result = "speeches: \n";
		for (LocalDateTime date : speeches) {
			result += date + "\n";
		}
		result = "passes: \n";
		for (LocalDateTime date : passes) {
			result += date + "\n";
		}
		return result;
	}
}
