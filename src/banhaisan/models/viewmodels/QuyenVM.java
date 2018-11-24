package banhaisan.models.viewmodels;

public class QuyenVM {
    private String maQuyen;
    private String tenQuyen;
    private boolean choPhep;

    public QuyenVM() {
    }

    public QuyenVM(String maQuyen, String tenQuyen, boolean choPhep) {
        this.maQuyen = maQuyen;
        this.tenQuyen = tenQuyen;
        this.choPhep = choPhep;
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

    public boolean isChoPhep() {
        return choPhep;
    }

    public void setChoPhep(boolean choPhep) {
        this.choPhep = choPhep;
    }
}
