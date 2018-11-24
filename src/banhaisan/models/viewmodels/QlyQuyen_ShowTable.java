package banhaisan.models.viewmodels;

public class QlyQuyen_ShowTable {
    private String maQuyen;
    private String tenQuyen;
    private String tenNghiepVu;

    public QlyQuyen_ShowTable() {
    }

    public QlyQuyen_ShowTable(String maQuyen, String tenQuyen, String tenNghiepVu) {
        this.maQuyen = maQuyen;
        this.tenQuyen = tenQuyen;
        this.tenNghiepVu = tenNghiepVu;
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

    public String getTenNghiepVu() {
        return tenNghiepVu;
    }

    public void setTenNghiepVu(String tenNghiepVu) {
        this.tenNghiepVu = tenNghiepVu;
    }
}
