package Entity;

public class TapChi extends ThuVienSach{
    private int soPhatHanh;
    private String thangPhatHanh;

    public TapChi(String maTaiLieu, String nhaXuatBan, String soLuongPhatHanh, int soPhatHanh, String thangPhatHanh) {
        super(maTaiLieu, nhaXuatBan, soLuongPhatHanh);
        this.soPhatHanh = soPhatHanh;
        this.thangPhatHanh = thangPhatHanh;
    }

    @Override
    public String toString() {
        return "Book{" +
                "tenTacGia='" + soPhatHanh + '\'' +
                ", soTrang=" + thangPhatHanh +
                ", ma Tai Liêu=" + super.getMaTaiLieu() +
                ", nha Xuat Ban=" + super.getNhaXuatBan() +
                ", so Luong Phat hanh=" + super.getSoLuongPhatHanh() +
                '}';
    }
}
