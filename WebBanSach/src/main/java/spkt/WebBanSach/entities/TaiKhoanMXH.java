package spkt.WebBanSach.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TaiKhoanMXH")
public class TaiKhoanMXH {
	private String maKH;
	private String tenDangNhap;
	private String matKhau;
	private Date ngayTao;
	private Boolean Quyen;
	private Set<TaiKhoanMXH> taiKhoanMXHs = new HashSet<TaiKhoanMXH>(0);
	
	public TaiKhoanMXH() {
		
	}
	
	public TaiKhoanMXH(String maKH, String tenDangNhap, String matKhau, Date ngayTao, Boolean Quyen) {
		this.maKH = maKH;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.ngayTao = ngayTao;
		this.Quyen = Quyen;
	}
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maKH", nullable = false)
	public String getMaKH() {
		return maKH;
	}

	public void setMaKH(String maKH) {
		this.maKH = maKH;
	}
	
	@Id
	@Column(name = "tenDangNhap", length = 20, nullable = false)
	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	
	@Column(name = "matKhau", length = 50, nullable = false)
	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	
	@Column(name = "ngayTao", nullable = false)
	public Date getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}
	
	@Column(name = "Quyen", nullable = false)
	public Boolean getQuyen() {
		return Quyen;
	}

	public void setQuyen(Boolean quyen) {
		Quyen = quyen;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "maKH,tenDangNhap")
	public Set<TaiKhoanMXH> getTaiKhoanMXHs() {
		return taiKhoanMXHs;
	}

	public void setTaiKhoanMXHs(Set<TaiKhoanMXH> taiKhoanMXHs) {
		this.taiKhoanMXHs = taiKhoanMXHs;
	}
}
