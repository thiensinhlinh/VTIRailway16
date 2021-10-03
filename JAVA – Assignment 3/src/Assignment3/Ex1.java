package Assignment3;

import java.util.Random;
import java.util.Scanner;

public class Ex1 {

	public static void main(String[] args) {
//		Question1();
//		Question2();
//		Question3();
//		Question4();
	}

	private static void Question4() {
		int a, b;
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap a:");
		a = scanner.nextInt();
		do {
			System.out.print("Nhap b:");
			b = scanner.nextInt();
			if (b == 0) {
				System.out.println("Nhap lai b khac 0");
			}
			;
		} while (b == 0);
		System.out.print("Thuong " + a + "/" + b + ": " + (a / b));
		scanner.close();
	}

	private static void Question3() {
//		int a = 30;
		Random random = new Random();
		int a = random.nextInt(100000);
//		String b = String.valueOf(a);
//		int x = 10;
//		for (int i =1; i < b.length(); i++ ) {
//			x = x * 10;
//		};
		while (a < 10000) {
			a = random.nextInt(100000);
		}
		;
		float c = (float) a / 10000;
		String d = String.valueOf(c);
		String e = d.substring(4);
		int f = Integer.parseInt(e);
		if (f < 10) {
			f = f * 10;
			System.out.println(f);
		} else {
			System.out.println(f);
		}
		;

	}

	private static void Question2() {
		Random random = new Random();
		int a = random.nextInt(100000);
//		while (a > 1) {
//		a = random.nextInt(100000) ;
//		};
//		System.out.println(a);
		if (a < 10) {
			System.out.println("0000" + a);

		} else if (a < 100) {
			System.out.println("000" + a);

		} else if (a < 1000) {
			System.out.println("00" + a);

		} else if (a < 10000) {
			System.out.println("0" + a);
		} else if (a > 10000) {
			System.out.println(a);
		}
		;

	}

	private static void Question1() {
		float Account1 = 5240.5f;
		float Account2 = 10970.055f;
		int luongAccuont1 = (int) Account1;
		int LuongAccount2 = (int) Account2;
		System.out.println(luongAccuont1);
		System.out.println(LuongAccount2);
	}

}
