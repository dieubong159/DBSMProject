package banhaisan.models.datamodels;

public class Quyen {
    private String maQuyen;
    private String tenQuyen;
    private int maNghiepVu;

    public Quyen() {
    }

    public Quyen(String maQuyen, String tenQuyen, int maNghiepVu) {
        this.maQuyen = maQuyen;
        this.tenQuyen = tenQuyen;
        this.maNghiepVu = maNghiepVu;
    }


    public String getMaQuyen() {
        return maQuyen;
    }

    public void setMaQuyen(String maQuyen) {
        this.maQuyen = maQuyen;
    }

    public String getTenQuyen() {
        return tenQuyen;
    }

    public void setTenQuyen(String tenQuyen) {
        this.tenQuyen = tenQuyen;
    }

    public int getMaNghiepVu() {
        return maNghiepVu;
    }

    public void setMaNghiepVu(int maNghiepVu) {
        this.maNghiepVu = maNghiepVu;
    }
}
