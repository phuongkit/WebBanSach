package spkt.WebBanSach.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "NhaXuatBan")
public class NhaXuatBan {
	private String maNhaXuatBan;
	private String tenNhaXuatBan;
	private String mucDoTinCay;
	private String diachiNhaXuatBan;
	private String soDienThoai;
	private String soChiNhanh;
	
	private Set<NhaXuatBan> nhaxuatbans = new HashSet<NhaXuatBan>(0);
	
	public NhaXuatBan() {
		
	}
	
	public NhaXuatBan(String maNhaXuatBan, String tenNhaXuatBan, String mucDoTinCay, String diachiNhaXuatBan, String soDienThoai, String soChiNhanh) {
		this.maNhaXuatBan = maNhaXuatBan;
		this.tenNhaXuatBan = tenNhaXuatBan;
		this.mucDoTinCay = mucDoTinCay;
		this.diachiNhaXuatBan = diachiNhaXuatBan;
		this.soDienThoai = soDienThoai;
		this.soChiNhanh = soChiNhanh;
	}
	
	@Id
	@Column(name = "maNhaXuatBan", length = 10)
	public String getMaNhaXuatBan() {
		return maNhaXuatBan;
	}

	public void setMaNhaXuatBan(String maNhaXuatBan) {
		this.maNhaXuatBan = maNhaXuatBan;
	}

	@Column(name = "tenNhaXuatBan", length = 100, nullable = false)
	public String getTenNhaXuatBan() {
		return tenNhaXuatBan;
	}

	public void setTenNhaXuatBan(String tenNhaXuatBan) {
		this.tenNhaXuatBan = tenNhaXuatBan;
	}

	@Column(name = "mucDoTinCay", length = 50, nullable = false)
	public String getMucDoTinCay() {
		return mucDoTinCay;
	}

	public void setMucDoTinCay(String mucDoTinCay) {
		this.mucDoTinCay = mucDoTinCay;
	}

	@Column(name = "diachiNhaXuatBan", length = 255, nullable = false)
	public String getDiachiNhaXuatBan() {
		return diachiNhaXuatBan;
	}

	public void setDiachiNhaXuatBan(String diachiNhaXuatBan) {
		this.diachiNhaXuatBan = diachiNhaXuatBan;
	}

	@Column(name = "soDienThoai", length = 15, nullable = false)
	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	@Column(name = "soChiNhanh", length = 10, nullable = false)
	public String getSoChiNhanh() {
		return soChiNhanh;
	}

	public void setSoChiNhanh(String soChiNhanh) {
		this.soChiNhanh = soChiNhanh;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "maNhaXuatBan")
	public Set<NhaXuatBan> getNhaxuatbans() {
		return nhaxuatbans;
	}

	public void setNhaxuatbans(Set<NhaXuatBan> nhaxuatbans) {
		this.nhaxuatbans = nhaxuatbans;
	}
}
