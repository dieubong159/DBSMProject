package banhaisan.models.datamodels;

public class HinhAnh {
    private String maSP_BV;
    private String url;

    public HinhAnh(String maSP_BV, String url) {
        this.maSP_BV = maSP_BV;
        this.url = url;
    }
    public HinhAnh(){}

    public String getMaSP_BV() {
        return maSP_BV;
    }

    public void setMaSP_BV(String maSP_BV) {
        this.maSP_BV = maSP_BV;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
