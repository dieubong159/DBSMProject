package banhaisan.models.datamodels;

public class DangNhap_KetNoi {
    private String ipAddress;
    private String email;
    private String passWord;

    public DangNhap_KetNoi() {
    }

    public DangNhap_KetNoi(String ipAddress, String email, String passWord) {
        this.ipAddress = ipAddress;
        this.email = email;
        this.passWord = passWord;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
}
