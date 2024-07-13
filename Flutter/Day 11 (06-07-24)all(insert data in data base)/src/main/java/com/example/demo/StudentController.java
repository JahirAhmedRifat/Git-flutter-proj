package com.example.demo;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RestController;
@CrossOrigin(origins = "*")
@RestController
public class StudentController {
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
}