package Assignment3;

import java.time.LocalDate;

public class Account {
	int id;
	String email, userName, fullName;
	LocalDate createDate;
	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", userName=" + userName + ", fullName=" + fullName
				+ ", createDate=" + createDate + "]";
	}
	
}
