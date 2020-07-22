package main;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.time.LocalDateTime;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Data {
	private String fileName;
	private Student[] students;

	public Data() {
		fileName = "C:\\pleiades\\workspace\\random\\data.json";
		students = readFromFile();
	}

	public Data(String fileName) {
		this.fileName = fileName;
		students = readFromFile();
	}

	public Student[] getStudents() {
		return students;
	}

	public boolean speech(Student student) throws IOException {
		for (Student s : students) {
			if (student.getName().contentEquals(s.getName())) {
				List<LocalDateTime> speeches = s.getSpeeches();
				speeches.add(LocalDateTime.now());
				s.setSpeeches(speeches);
				writeToFile(students);
				return true;
			}
		}
		return false;
	}

	public boolean pass(Student student) throws IOException {
		for (Student s : students) {
			if (student.getName().contentEquals(s.getName())) {
				List<LocalDateTime> passes = s.getPasses();
				passes.add(LocalDateTime.now());
				s.setPasses(passes);
				writeToFile(students);
				return true;
			}
		}
		return false;
	}

	public Student[] readFromFile() {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		try (Reader reader = new FileReader(this.fileName)) {

			return gson.fromJson(reader, Student[].class);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void writeToFile(Student[] students) throws IOException {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		Writer writer = new FileWriter(fileName);
		gson.toJson(students, writer);
		writer.flush();
		writer.close();
	}
}
