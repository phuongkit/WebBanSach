package entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "KhachHang")
public class KhachHang {
	private String maKhachHang;
	private String hoTen;
	private String email;
	private String dienThoai;
	private String diaChi;
	private Set<KhachHang> khachhangs = new HashSet<KhachHang>(0);

	public KhachHang() {

	}
	
	public KhachHang(String maKhachHang, String hoTen, String email, String dienThoai) {
		this.maKhachHang = maKhachHang;
		this.hoTen = hoTen;
		this.email = email;
		this.dienThoai = dienThoai;
	}
	
	@Id
	@Column(name = "maKhachHang", length = 10)
	public String getMaKhachHang() {
		return maKhachHang;
	}
	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}
	
	@Column(name = "hoTen", length = 50, nullable = false)
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	
	@Column(name = "email", length = 50, nullable = false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "dienThoai", length = 15, nullable = false)
	public String getDienThoai() {
		return dienThoai;
	}
	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}
	
	@Column(name = "diaChi", length = 500, nullable = false)
	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "maKhachHang")
	public Set<KhachHang> getkhachhangs() {
		return khachhangs;
	}
	public void setkhachhangs(Set<KhachHang> khachhangs) {
		this.khachhangs = khachhangs;
	}
}
