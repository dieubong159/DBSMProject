package banhaisan.models.datamodels;

public class NghiepVu {
    private int maNghiepVu;
    private String tenNghiepVu;
    private String moTa;

    public NghiepVu() {
    }

    public NghiepVu(int maNghiepVu, String tenNghiepVu, String moTa) {
        this.maNghiepVu = maNghiepVu;
        this.tenNghiepVu = tenNghiepVu;
        this.moTa = moTa;
    }

    public int getMaNghiepVu() {
        return maNghiepVu;
    }

    public void setMaNghiepVu(int maNghiepVu) {
        this.maNghiepVu = maNghiepVu;
    }

    public String getTenNghiepVu() {
        return tenNghiepVu;
    }

    public void setTenNghiepVu(String tenNghiepVu) {
        this.tenNghiepVu = tenNghiepVu;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
}
