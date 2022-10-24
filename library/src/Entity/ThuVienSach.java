package Entity;

public class ThuVienSach implements IThuVienSach{
    private String maTaiLieu;
    private String nhaXuatBan;
    private String soLuongPhatHanh;

    public ThuVienSach(String maTaiLieu, String nhaXuatBan, String soLuongPhatHanh) {
        this.maTaiLieu = maTaiLieu;
        this.nhaXuatBan = nhaXuatBan;
        this.soLuongPhatHanh = soLuongPhatHanh;
    }

    public String getMaTaiLieu() {
        return maTaiLieu;
    }

    public void setMaTaiLieu(String maTaiLieu) {
        this.maTaiLieu = maTaiLieu;
    }

    public String getNhaXuatBan() {
        return nhaXuatBan;
    }

    public void setNhaXuatBan(String nhaXuatBan) {
        this.nhaXuatBan = nhaXuatBan;
    }

    public String getSoLuongPhatHanh() {
        return soLuongPhatHanh;
    }

    public void setSoLuongPhatHanh(String soLuongPhatHanh) {
        this.soLuongPhatHanh = soLuongPhatHanh;
    }

    @Override
    public String toString() {
        return "ThuVienSach{" +
                "maTaiLieu='" + maTaiLieu + '\'' +
                ", nhaXuatBan='" + nhaXuatBan + '\'' +
                ", soLuongPhatHanh='" + soLuongPhatHanh + '\'' +
                '}';
    }

    @Override
    public void display() {
        System.out.println("\n************************");
        System.out.println("Ma tai lieu: " + maTaiLieu);
        System.out.println("Nha xuat ban: " + nhaXuatBan);
        System.out.println("So luong phat hanh: " + soLuongPhatHanh);

    }
}

