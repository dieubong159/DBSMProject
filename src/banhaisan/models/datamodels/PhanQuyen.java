package banhaisan.models.datamodels;

public class PhanQuyen {
    private String maQuyen;
    private String maNguoiDung;

    public PhanQuyen() {
    }

    public PhanQuyen(String maQuyen, String maNguoiDung) {
        this.maQuyen = maQuyen;
        this.maNguoiDung = maNguoiDung;
    }

    public String getMaQuyen() {
        return maQuyen;
    }

    public void setMaQuyen(String maQuyen) {
        this.maQuyen = maQuyen;
    }

    public String getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(String maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }
}
