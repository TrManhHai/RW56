package BackEnd;

import Entity.Book;
import Entity.Newspaper;
import Entity.TapChi;
import Entity.ThuVienSach;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class QuanLy {
    private List<ThuVienSach> lists;
    private Scanner scanner;

    public QuanLy() {
        lists = new ArrayList<>();
        scanner = new Scanner(System.in);
    }

    private void displayMenu() {
        System.out.println("\n========== Please Choose =========");
        System.out.println("1 - Thêm mới tài liệu");
        System.out.println("2 - Xóa tài liệu theo mã");
        System.out.println("3 - Hiển thị thông tin tài liệu");
        System.out.println("4 - Tìm kiếm tài liệu");
        System.out.println("5 - Thoát chương trình !");
        System.out.println("==================================\n");
    }

    public void runProgram() {
        while (true) {
            displayMenu();
            int choose = scanner.nextInt();
            switch (choose) {
                case 1:
                    // thêm mới tài liệu
                    insertDocument();
                    break;
                case 2:
                    // xóa tài liệu
                    removeDocument();
                    break;
                case 3:
                    // Hiển thị thông tin tài liệu
                    viewListDocument();
                    break;
                case 4:
                    // tìm kiếm tài liệu
                    searchDocument();
                    break;
                case 5:
                    System.out.println("Bye Bye !");
                    return;
                default:
                    System.out.println("Vui lòng chọn từ 1 -> 5");
                    break;
            }
        }
    }

    private void insertDocument() {
        System.out.println("Bạn muốn nhập tài liệu loại nào ?");
        System.out.println("|   1 - Sách   |   2 - Tạp chí   |   3 - Báo   |");
        int choose = scanner.nextInt();
        switch (choose) {
            case 1:
                // gọi hàm insert Sách:
                insertBook();
                break;
            case 2:
                // gọi hàm insert Tạp chí
                insertMegazine();
                break;
            case 3:
                // gọi hàm insert báo
                insertNewsPaper();
                break;
            default:
                System.out.println("Vui lòng chỉ chọn từ 1 -> 3");
        }
    }

    private void insertBook() {
        System.out.println("Mời nhập Ma Tai Lieu: ");
        scanner.nextLine();
        String b = scanner.nextLine();
        System.out.println("Mời nhập Ten Nha Xuat Ban: ");
        String c = scanner.nextLine();
        System.out.println("Mời nhập So Ban Phat Hanh: ");
        String d = scanner.nextLine();
        System.out.println("Mời nhập Ten Tac Gia: ");
        String e = scanner.nextLine();
        System.out.println("Mời nhập So Trang: ");
        int f = scanner.nextInt();
        Book book1 = new Book(b, c, d, e, f);
        lists.add(book1);

    }


    private void insertMegazine() {

        System.out.println("Mời nhập Ma Tai Lieu: ");
        scanner.nextLine();
        String maTaiLieu = scanner.nextLine();
        System.out.println("Mời nhập Ten Nha Xuat Ban: ");
        String nhaXuatBan = scanner.nextLine();
        System.out.println("Mời nhập So Ban Phat Hanh: ");
        String soLuongPhatHanh = scanner.nextLine();
        System.out.println("Mời nhập So Phat Hanh: ");
        int soPhatHanh = scanner.nextInt();
        System.out.println("Mời nhập Thang Phat Hanh: ");
        scanner.nextLine();
        String thangPhatHanh = scanner.nextLine();



        TapChi tapChi = new TapChi(maTaiLieu, nhaXuatBan, soLuongPhatHanh, soPhatHanh, thangPhatHanh);

        lists.add(tapChi);
    }


    private void insertNewsPaper() {
        System.out.println("Mời nhập Ma Tai Lieu: ");
        scanner.nextLine();
        String ah = scanner.nextLine();
        System.out.println("Mời nhập Ten Nha Xuat Ban: ");
        String cj = scanner.nextLine();
        System.out.println("Mời nhập So Ban Phat Hanh: ");
        String ak = scanner.nextLine();
        System.out.println("Mời nhập Ngay Phat Hanh: ");
        String al = scanner.nextLine();
        Newspaper newspaper = new Newspaper(ah, cj, ak, al);
        lists.add(newspaper);

    }

    private void removeDocument() {
        //Sử dụng vòng lặp để tìm index của tài liệu cần được remove, sau đó gọi hàm remove của ArrayList để xóa
        System.out.println("Moi nhap ma tai lieu muon xoa");
        scanner.nextLine();
        String maTaiLieuXoa = scanner.nextLine();
//        Boolean checkExists = false;
//        for (ThuVienSach thuVienSach : lists) {
//            if (thuVienSach.getMaTaiLieu().equals(maTaiLieuXoa)) {
//                checkExists = true;
//            }
//        }
//        if (checkExists) {
//            Iterator iterator = lists.iterator();
//            while (iterator.hasNext()) {
//                ThuVienSach sachRemove = (ThuVienSach) iterator.next();
//                if (sachRemove.getMaTaiLieu().equals(maTaiLieuXoa)) {
//                    iterator.remove();
//
//                }
//            }
//        } else {
//            System.out.println("Không có mã tài liệu này!");
//        }

        ///Cach 1:

//        for (int f = 0; f < lists.size() ; f++){
//            if(lists.get(f).getMaTaiLieu().equals(maTaiLieuXoa)) {
//                lists.remove(f);
//            }
//        }
        //Cách 2:
        boolean check = lists.removeIf(s -> s.getMaTaiLieu().equals(maTaiLieuXoa)) ;
        if(check){
            System.out.println("Đã xoá thành công ! \n");
        } else {
            System.out.println("Không tồn tại mã để xoá \n");
        }

    }

    // Hàm dùng để in ra danh sách document (nhớ sử dụng đa hình)
    private void viewListDocument() {

        for (ThuVienSach danhsachtailieu : lists) {
            System.out.println(danhsachtailieu);
        }

    }


    // Hàm dùng để tìm kiếm tài liệu
    private void searchDocument() {
        // Người dùng sẽ nhập mã tài liệu, và hệ thống trả ra (in) màn hình tài liệu tương ứng.
        // gợi ý, sử dụng lòng lặp để tìm
        System.out.println("Moi nhap ma tai lieu muốn tìm kiếm ");
        scanner.nextLine();
        String maTaiLieuXoa = scanner.nextLine();
        Boolean checkExists = false;
        for (ThuVienSach thuVienSach : lists) {
            if (thuVienSach.getMaTaiLieu().equals(maTaiLieuXoa)) {
                checkExists = true;
                System.out.println(thuVienSach);
            }

        }
        if(!checkExists){
            System.out.println("Không tìm thấy tài liệu");
        }
    }
}

