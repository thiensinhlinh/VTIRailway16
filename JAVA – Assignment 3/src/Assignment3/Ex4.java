package Assignment3;

import java.util.Random;
import java.util.Scanner;

public class Ex4 {

	public static void main(String[] args) {
//		Question1();
//		Question2();
//		Question3();
//		Question4();
//		Question5();
//		Question6();
//		Question7();
//		Question10();
//		Question11();
//		Question12();
//		Question13();
		Question14();
		
	}


	private static void Question14() {
		
		
	}


	private static void Question13() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap chuoi ki tu:");
		String a = scanner.nextLine();
		scanner.close();
		int d = 0;
	aa:	for (int i = 0; i < a.length(); i++) {
			for (char j = '0'; j < '9'; j++) {
				if (j == a.charAt(i)) {
					d++;
					;
				}
			}
		}
		if (d == 0) {
			System.out.println("true");
		}else {
			System.out.println("false");
		}		
		
	}


	private static void Question12() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap xau ki tu:");
		String a = scanner.nextLine();
		String[] c = a.split("");
		String e = "";

		for (int i = c.length; i >= 1; i--) {
			e = e + c[i - 1];
		}
		System.out.println(e);
	}


	private static void Question11() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap chuoi:");
		String a = scanner.nextLine();
		int d = 0;
		for (int i = 0; i < a.length(); i++) {
			if ('a' == a.charAt(i)) {
				d = d + 1;
			}
		}
		System.out.print("so la xuat hien ki tu 'a':"+ d);
		scanner.close();
	}


	private static void Question10() {
		String a = "asdfgh";
		String b = "hgfdsa";
		String[] c = a.split("");
		String e = "";

		for (int i = c.length; i >= 1; i--) {
			e = e + c[i - 1];

		}

		if (b.equals(e)) {
			System.out.println("Ok");
		} else {
			System.out.println("Ko");
		}
		
	
	}

	private static void Question7() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap day du ho ten:");
		String a = scanner.nextLine();
		a = a.trim();
		a = a.toLowerCase();
		String[] b = a.split("\s+");
		String e = "";
		for (String c : b) {
			String d = c.substring(0, 1).toUpperCase() + c.substring(1);
			e = e + d + " ";
		}
		;
		e = e.trim();
		System.out.println(e);

	}

	private static void Question6() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap day du ho ten:");
		String a = scanner.nextLine();
		//replaceAll
		System.out.print("Nhap day du ho ten:");
		String aa = scanner.nextLine();
		String ab = aa.replaceAll("\s+"," ");
		System.out.println(ab);
		String[] b = a.split("\s+");
		for (String c : b) {
			System.out.println(c);
		};	
	}

	private static String replaceAll(String string, String string2) {
		// TODO Auto-generated method stub
		return null;
	}


	private static void Question5() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap ten:");
		String a = scanner.nextLine();
		System.out.print("Nhap ho:");
		String b = scanner.nextLine();
		System.out.println(b + " " + a);
		scanner.close();

	}

	private static void Question4() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap ten:");
		String a = scanner.nextLine();
		a = a.trim();
		a = a.toUpperCase();
		for (int i = 0; i < a.length(); i++) {
			System.out.println("Ki tu thu " + (i + 1) + " :" + a.charAt(i));
		}
		;
		scanner.close();

	}

	private static void Question3() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap ten:");
		String a = scanner.nextLine();
		a = a.trim();
		a = a.toLowerCase();
		a = a.substring(0, 1).toUpperCase() + a.substring(1);
		System.out.println(a);
		scanner.close();

	}

	private static void Question2() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap xau s1:");
		String s1 = scanner.nextLine();
		System.out.print("Nhap xau s2:");
		String s2 = scanner.nextLine();
		s1 = s1 + s2;
		System.out.println(s1);
		scanner.close();

	}

	private static void Question1() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap xau ky tu: ");
		String a = scanner.nextLine();
		System.out.println(a.length());
		scanner.close();
	}

}
