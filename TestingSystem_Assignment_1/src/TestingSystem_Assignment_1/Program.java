package TestingSystem_Assignment_1;

import java.time.LocalDate;

import TestingSystem_Assignment_1.Position.PositionName;

public class Program {

	public static void main(String[] args) {
		//Department
		Department dep1 = new Department();
		dep1.id = 1;
		dep1.name = "Marketing";
		
		Department dep2 = new Department();
		dep2.id = 2;
		dep2.name = "Sale";
		
		Department dep3 = new Department();
		dep3.id = 3;
		dep3.name = "Bảo Vệ";
		
		// Position
		Position pos1 = new Position();
		pos1.id = 1;
		pos1.name = PositionName.Dev;
		
		Position pos2 = new Position();
		pos2.id = 2;
		pos2.name = PositionName.Test;
		
		Position pos3 = new Position();
		pos3.id = 3;
		pos3.name = PositionName.Scrum_Master;
		
		Position pos4 = new Position();
		pos4.id = 4;
		pos4.name = PositionName.PM;
		
		//Group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Nhóm 1";
		
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Nhóm 2";
		
		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Nhóm 3";
		
		
		//Account
		Account acc1 = new Account();
		acc1.id = 1;
		acc1.email = "QuangAnh.198@gmail.com";
		acc1.userName = "Anh";
		acc1.fullName = "Đinh Qunag Anh";
		acc1.department = dep1;
		acc1.position = pos1;
		acc1.locateDate = LocalDate.now();
		Group[] gacc1 = {group1, group2};
		acc1.gruops = gacc1;
		
		Account acc2 = new Account();
		acc2.id = 2;
		acc2.email = "NguyenAn.26@gmail.com";
		acc2.userName = "An";
		acc2.fullName = "Nguyễn Mạnh An";
		acc2.department = dep2;
		acc2.position = pos2;
		acc2.locateDate = LocalDate.now();
		Group[] gacc2 = {group1, group3};
		acc2.gruops = gacc2;
		
		Account acc3 = new Account();
		acc3.id = 3;
		acc3.email = "Dai.05@gmail.com";
		acc3.userName = "Đại";
		acc3.fullName = "Đại Dương";
		acc3.department = dep3;
		acc3.position = pos3;
		acc3.locateDate = LocalDate.now();
		Group[] gacc3 = {group2, group3};
		acc3.gruops = gacc3;
		
		//in
		System.out.println("Account 1:ID = "+acc1.id+
							"\nEmail: "+acc1.email+
							"\nUserName: "+acc1.userName+
							"\nFullName: "+acc1.fullName+
							"\nDepartment: "+acc1.department.name+
							"\nPosition: "+acc1.department.name+
							"\nGroup: "+acc1.gruops[0].name+
							", "+acc1.gruops[1].name+
							"\nCreateDate: "+acc1.locateDate+
							"\n");
		
		System.out.println("Account 2:ID = "+acc2.id+
							"\nEmail: "+acc2.email+
							"\nUserName: "+acc2.userName+
							"\nFullName: "+acc2.fullName+
							"\nDepartment: "+acc2.department.name+
							"\nPosition: "+acc2.department.name+
							"\nGroup: "+acc2.gruops[0].name+
							", "+acc2.gruops[1].name+
							"\nCreateDate: "+acc2.locateDate+
							"\n");
		
		System.out.println("Account 3:ID = "+acc3.id+
							"\nEmail: "+acc3.email+
							"\nUserName: "+acc3.userName+
							"\nFullName: "+acc3.fullName+
							"\nDepartment: "+acc3.department.name+
							"\nPosition: "+acc3.department.name+
							"\nGroup: "+acc3.gruops[0].name+
							", "+acc3.gruops[1].name+
							"\nCreateDate: "+acc3.locateDate+
							"\n");
	}

}
