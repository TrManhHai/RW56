package Entity;

public class Newspaper extends ThuVienSach{
    private String ngayPhatHanh;

    public Newspaper(String maTaiLieu, String nhaXuatBan, String soLuongPhatHanh, String ngayPhatHanh) {
        super(maTaiLieu, nhaXuatBan, soLuongPhatHanh);
        this.ngayPhatHanh = ngayPhatHanh;
    }

    @Override
    public String toString() {
        return "Book{" +
                "tenTacGia='" + ngayPhatHanh + '\'' +
                ", ma Tai Liêu=" + super.getMaTaiLieu() +
                ", nha Xuat Ban=" + super.getNhaXuatBan() +
                ", so Luong Phat hanh=" + super.getSoLuongPhatHanh() +
                '}';
    }
}
