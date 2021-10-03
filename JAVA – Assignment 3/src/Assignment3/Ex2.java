package Assignment3;

import java.time.LocalDate;


public class Ex2 {

	public static void main(String[] args) {
		Question1();
	}

	private static void Question1() {
		Account[] account = new Account[5];
		for (int i = 0; i < account.length; i++ ) {
			account[i] = new Account();
			account[i].id = i + 1;
			account[i].email = "Email " + (i + 1);
			account[i].fullName = "Fullname " + (i + 1);
			account[i].userName = "Username " + (i + 1);
		};
		for (int i = 0; i < account.length; i++) {
			System.out.println(account[i].toString());
		}
	}

}
