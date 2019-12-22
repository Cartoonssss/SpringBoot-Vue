package com.example.onlineexam;

import com.example.onlineexam.mapper.ExamManageMapper;
import com.example.onlineexam.pojo.ExamManage;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OnlineExamApplicationTests {
	@Autowired
	private ExamManageMapper examManageMapper;

	@Test
	public void contextLoads() {
	}

	@Test
	public void testExamManageMapper() {
		List<ExamManage> examManages = examManageMapper.selectAllExamManage();
		System.out.println("examManages = " + examManages);
	}
}
