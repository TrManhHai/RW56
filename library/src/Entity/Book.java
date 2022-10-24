package Entity;

public class Book extends ThuVienSach {
    private String tenTacGia;
    private int soTrang;


    public Book(String maTaiLieu, String nhaXuatBan, String soLuongPhatHanh, String tenTacGia, int soTrang) {
        super(maTaiLieu, nhaXuatBan, soLuongPhatHanh);
        this.tenTacGia = tenTacGia;
        this.soTrang = soTrang;
    }

    public String getTenTacGia() {
        return tenTacGia;
    }

    public void setTenTacGia(String tenTacGia) {
        this.tenTacGia = tenTacGia;
    }

    public int getSoTrang() {
        return soTrang;
    }

    public void setSoTrang(int soTrang) {
        this.soTrang = soTrang;
    }

    @Override
    public String toString() {
        return "Book{" +
                "tenTacGia='" + tenTacGia + '\'' +
                ", soTrang=" + soTrang +
                ", ma Tai Liêu=" + super.getMaTaiLieu() +
                ", nha Xuat Ban=" + super.getNhaXuatBan() +
                ", so Luong Phat hanh=" + super.getSoLuongPhatHanh() +
                '}';
    }
}
