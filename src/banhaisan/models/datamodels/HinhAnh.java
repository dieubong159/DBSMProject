package banhaisan.models.datamodels;

public class HinhAnh {
    private String maSP_BV;
    private boolean loai;
    private String url;

    public HinhAnh(String maSP_BV, boolean loai, String url) {
        this.maSP_BV = maSP_BV;
        this.loai = loai;
        this.url = url;
    }
    public HinhAnh(){}

    public String getMaSP_BV() {
        return maSP_BV;
    }

    public void setMaSP_BV(String maSP_BV) {
        this.maSP_BV = maSP_BV;
    }

    public boolean isLoai() {
        return loai;
    }

    public void setLoai(boolean loai) {
        this.loai = loai;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
