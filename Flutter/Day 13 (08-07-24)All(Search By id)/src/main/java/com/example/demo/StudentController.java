package com.example.demo;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RestController;
@CrossOrigin(origins = "*")
@RestController
public class StudentController {
	List<Student> stlist=new ArrayList<>();
	
	@PostMapping(value="/signin")
	public Student signinStudent(@RequestBody Student s) {
		StudentDA d = new StudentDA();
		Student st=d.studentSigninById(s.id);
		return st;
	}

	@PostMapping(value="/insert")
	public Student insertStudent(@RequestBody Student s) {
		StudentDA d = new StudentDA();
		Student st=d.insert(s);
		return st;
	}
	
	@GetMapping(value="/students")
	public List<Student> allstudent(){
		StudentDA d = new StudentDA();
		List<Student> stlist=new ArrayList<>();
		stlist=d.allstudent();
		return stlist;
	}
	
	@GetMapping(value="/search/{id}")
	public List<Student> serach(@PathVariable("id") int id){
		StudentDA d = new StudentDA();
		stlist=d.searchstudent(id);
		return stlist;
	}
	
}